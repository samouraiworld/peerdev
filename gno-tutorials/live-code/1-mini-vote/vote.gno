package vote

import (
	"std"
	"strconv"
	"time"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/avl/list"
)

type Action struct {
	Id            uint64
	Title         string
	Description   string
	ExecuteAction func(interface{})
	Payload       interface{}
}

type Condition struct {
	Id              uint64
	Title           string
	Description     string
	VerifyCondition func(interface{}) bool
	Payload         interface{}
}

type Ballot int

const (
	Elligible Ballot = iota
	Yes
	No
	Abstain
)

type Role int

const (
	None  Role = iota
	Admin      // Edit + Delete + Close
	CanEdit
	CanClose
)

type Proposal struct {
	Id       uint64
	Title    string
	Content  string
	Deadline time.Time
	Roles    *avl.Tree // (address -> Role)

	Voters    *avl.Tree // Stores votes (address -> Ballot)
	Action    *Action
	Condition *Condition

	Closed   bool
	Executed bool
	IsPublic bool
}

var (
	actions   list.List
	condition list.List
	proposals list.List
)

func CreateAction(title string, description string, executeAction func(interface{}), payload interface{}) uint64 {
	id := uint64(actions.Len())
	action := &Action{
		Id:            id,
		Title:         title,
		Description:   description,
		ExecuteAction: executeAction,
		Payload:       payload,
	}
	actions.Append(action)
	return id
}

func CreateCondition(title string, description string, verifyCondition func(interface{}) bool, payload interface{}) uint64 {
	id := uint64(condition.Len())
	cond := &Condition{
		Id:              id,
		Title:           title,
		Description:     description,
		VerifyCondition: verifyCondition,
		Payload:         payload,
	}
	condition.Append(cond)
	return id
}

func CreatePublicProposal(title string,
	content string,
	deadline time.Time,
	actionID uint64,
	conditionID uint64,
	roles map[std.Address]Role,
) {
	new_roles := avl.NewTree()
	for addr, role := range roles {
		new_roles.Set(addr.String(), role)
	}
	newProposal := Proposal{
		Id:        uint64(proposals.Len() - 1),
		Title:     title,
		Content:   content,
		Deadline:  deadline,
		Roles:     new_roles,
		Voters:    avl.NewTree(),
		Action:    actions.Get(int(actionID)).(*Action),
		Condition: condition.Get(int(conditionID)).(*Condition),
		Closed:    false,
		Executed:  false,
		IsPublic:  true,
	}
	proposals.Append(newProposal)
}

func CreateProposal(title string,
	content string,
	deadline time.Time,
	actionID uint64,
	conditionID uint64,
	allowedVoters []std.Address,
	roles map[std.Address]Role) {
	new_roles := avl.NewTree()
	for addr, role := range roles {
		new_roles.Set(addr.String(), role)
	}
	voters := avl.NewTree()
	for _, addr := range allowedVoters {
		voters.Set(addr.String(), Elligible)
	}
	newProposal := Proposal{
		Id:        uint64(proposals.Len() - 1),
		Title:     title,
		Content:   content,
		Deadline:  deadline,
		Roles:     new_roles,
		Voters:    voters,
		Action:    actions.Get(int(actionID)).(*Action),
		Condition: condition.Get(int(conditionID)).(*Condition),
		Closed:    false,
		Executed:  false,
		IsPublic:  false,
	}
	proposals.Append(newProposal)
}

func CastVote(proposalID uint64, vote Ballot) {
	proposal := getProposal(proposalID)
	addr := std.PreviousRealm().Address()
	ballot, hasBallot := proposal.Voters.Get(addr.String())

	// Only allowed voters can vote on private proposals
	if proposal.IsPublic {
		if hasBallot {
			panic("You are not allowed to vote on this proposal.")
		}
	} else {
		if !hasBallot {
			panic("You are not allowed to vote on this proposal.")
		}
		if ballot != Elligible {
			panic("Address already voted.")
		}
	}
	proposal.Voters.Set(addr.String(), vote)
}

func CloseProposal(proposalID uint64) {
	proposal := getProposal(proposalID)

	prevAddr := std.PreviousRealm().Address()
	role, hasRole := proposal.Roles.Get(prevAddr.String())
	if !hasRole {
		panic(prevAddr.String() + " has no role.")
	}
	switch role {
	case Admin, CanClose:
		proposal.Closed = true
		break
	default:
		panic(prevAddr.String() + " has not enough permissions.")
	}
}

func ExecuteProposal(proposalID uint64) {
	proposal := getProposal(proposalID)
	if proposal.Executed {
		panic("Proposal already executed.")
	}
	if proposal.Condition != nil && !proposal.Condition.VerifyCondition(proposal.Condition.Payload) {
		panic("Condition not met for execution.")
	}
	if proposal.Action != nil {
		proposal.Action.ExecuteAction(proposal.Action.Payload)
	}
	proposal.Executed = true
	proposal.Closed = true
}

func getProposal(proposalID uint64) Proposal {
	var proposal = proposals.Get(int(proposalID))
	if proposal == nil {
		panic("Proposal does not exist.")
	}
	return proposal.(Proposal)
}

func Render(_ string) string {
	out := "Proposals:\n"
	for i := 0; i < proposals.Len(); i++ {
		prop := proposals.Get(i).(Proposal)
		out += "-----------------------------\n"
		out += "ID: " + strconv.Itoa(int(prop.Id)) + "\n"
		out += "Title: " + prop.Title + "\n"
		out += "Content: " + prop.Content + "\n"
		out += "Deadline: " + prop.Deadline.String() + "\n"
		out += "Closed: " + strconv.FormatBool(prop.Closed) + "\n"
		out += "Executed: " + strconv.FormatBool(prop.Executed) + "\n"
		out += "Public: " + strconv.FormatBool(prop.IsPublic) + "\n"
		out += "Votes:\n"
		prop.Voters.IterateByOffset(0, prop.Voters.Size(), func(key string, value any) bool {
			out += "  " + key + ": " + strconv.Itoa(int(value.(Ballot))) + "\n"
			return true
		})
		out += "\n"
	}
	return out
}
