package main

import (
	"gno.land/p/samourai/basedao"
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/mydao"
)

func main() {
	payload := basedao.ActionAddMember{Address: "g1nqsjex9aguqy062wdrryvvg9u6dn6e9u44dmkm", Roles: []string{"finance-officer"}}
	action := basedao.NewAddMemberAction(&payload)

	proposal := daokit.ProposalRequest{
		Title:       "Adding new member",
		Description: "Adding new finance-officer.",
		Action:      action,
	}

	println("Proposal Title:", proposal.Title)
	println("Proposal Description:", proposal.Description)
	println("Action Type:", proposal.Action.Type())
	println("Action String:", proposal.Action.String())
	mydao.Propose(proposal)

}
