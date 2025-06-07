package main

import (
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/mydao"
)

func main() {
	action := mydao.NewPostAction("hello", "world")

	proposal := daokit.ProposalRequest{
		Title:       "Sample Proposal",
		Description: "This is a sample proposal using PrintAction.",
		Action:      action,
	}

	println("Proposal Title:", proposal.Title)
	println("Proposal Description:", proposal.Description)
	println("Action Type:", proposal.Action.Type())
	println("Action String:", proposal.Action.String())
	mydao.Propose(proposal)

}
