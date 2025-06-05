package main

import (
	"gno.land/p/samourai/basedao"
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/mydao"
)

func main() {
	payload := basedao.ActionAddMember{Address: "g1j9zh3ce7a5tg2esjzherfrx7m3n842k2vmj395", Roles: []string{"admin", "public-relationships"}}
	action := basedao.NewAddMemberAction(&payload)

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
