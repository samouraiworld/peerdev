package vote

import (
	"std"

	"gno.land/p/demo/avl"
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
	None Role = iota
	Admin // Delete + Edit
	CanEdit
	CanDelete
)

type Proposal struct {
	Id        uint64
	Title     string
	Content   string
	Deadline  time.Time
	Roles     *avl.Tree // (address -> Role)

	Voters    *avl.Tree // Stores votes (address -> bool)
	Action    *Action
	Condition *Condition

	Closed    bool
	Executed  bool
	IsPublic  bool	
}

var (
	proposals *avl.Tree = avl.NewTree()
)

func init() {
}

func CreatePublicProposal(title string, 
	content string, 
	deadline time.Time, 
	conditionID uint64,
	actionID uint64,
	roles map[std.Address]Role) Proposal {
		newProposal := Proposal{}
}

func CreateProposal(title string, 
	content string, 
	deadline time.Time, 
	conditionID uint64,
	actionID uint64, 
	allowedVoters []std.Address,
	roles map[std.Address]Role) Proposal {
}



func CastVote() {

}

func CloseProposal(proposalID uint64) {
	var proposal Proposal = proposals.Get(proposalID)

	if (std.PreviousRealm().Address() == proposal. )
	proposal.Closed = true
}

func ExecuteProposal(proposalID uint64) {
	proposal := 
}

func Render(_ string) string {
	return ""
}
