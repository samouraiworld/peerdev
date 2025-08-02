package main

import (
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/mydao"
)

func main() {
	// Calling the custom action
	action := mydao.NewPostAction("hello", "world")

	proposal := daokit.ProposalRequest{
		Title:       "Sample Proposal",
		Description: "This is a sample proposal using PrintAction.",
		Action:      action,
	}
	mydao.Propose(proposal)
}
