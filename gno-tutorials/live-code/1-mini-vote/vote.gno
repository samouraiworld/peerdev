package vote

import (
	"std"
	"time"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/avl/list"
)

type Action struct {
	Id            uint64
	Title         string
	Content       string
	ExecuteAction func(args ...any)
}

type Condition struct {
	Id              uint64
	Title           string
	Content         string
	VerifyCondition func(args ...any) bool
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

func init() {
}

func CreatePublicProposal(title string,
	content string,
	deadline time.Time,
	actionID uint64,
	conditionID uint64,
	roles map[std.Address]Role,
) Proposal {
	roles := avl.NewTree()
	for addr, role := range roles {
		roles.Set(addr, role)
	}
	newProposal := Proposal{
		Id:        uint64(proposals.Len()),
		Title:     title,
		Content:   content,
		Deadline:  deadline,
		Roles:     roles,
		Voters:    avl.NewTree(),
		Action:    actions.Get(actionID),
		Condition: condition.Get(conditionID),
		Closed:    false,
		Executed:  false,
		IsPublic:  true,
	}
}

func CreateProposal(title string,
	content string,
	deadline time.Time,
	actionID uint64,
	conditionID uint64,
	allowedVoters []std.Address,
	roles map[std.Address]Role) Proposal {
	roles := avl.NewTree()
	for addr, role := range roles {
		roles.Set(addr, role)
	}
	voters := avl.NewTree()
	for i, addr := range allowedVoters {
		voters.Set(addr.String(), Elligible)
	}
	newProposal := Proposal{
		Id:        uint64(proposals.Len()),
		Title:     title,
		Content:   content,
		Deadline:  deadline,
		Roles:     roles,
		Voters:    voters,
		Action:    actions.Get(actionID),
		Condition: condition.Get(conditionID),
		Closed:    false,
		Executed:  false,
		IsPublic:  false,
	}
}

func CastVote(proposalID uint64, vote Ballot) {
	var proposal Proposal = proposals.Get(proposalID)
	if !proposal {
		panic("Proposal does not exist.")
	}
	addr := std.PreviousRealm().Address()
	ballot, hasBallot := proposal.Voters.Get(addr)

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
	proposal.Voters.Set(addr, vote)
}

func CloseProposal(proposalID uint64) {
	var proposal Proposal = proposals.Get(proposalID)

	prevAddr := std.PreviousRealm().Address()
	role, hasRole = proposal.Roles.Get(prevAddr)
	if !hasRole {
		panic(prevAddr.String() + " has no role.")
	}
	switch role {
	case Admin, CanClose:
		proposal.Closed = true
		break
	}
	panic(prevAddr.String() + " has not enough permissions.")
}

func ExecuteProposal(proposalID uint64) {
	// proposal :=
}

func Render(_ string) string {
	return ""
}
