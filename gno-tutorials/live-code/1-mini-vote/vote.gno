package vote

import "time"

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
	VerifyCondition func(args ...any)
}

type Proposal struct {
	Id       uint64
	Title    string
	Content  string
	Deadline time.Time

	Action    *Action
	Condition *Condition
}

func CreateProposal(Title: string, 
	Content: string, 
	Deadline: time.Time, 
	Action: uint64, 
	Condition: uint64) Proposal {
		proposal := Proposal()

}

func CastVote() {

}

func CloseProposal() {

}

func ExecuteProposal(proposalID uint64) {

}

func Render(_ string) string {
	return ""
}
