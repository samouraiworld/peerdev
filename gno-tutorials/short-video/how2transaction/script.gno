package main

import (
	"gno.land/p/samourai/basedao"
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/mydao"
)

// Proposal to add a new member in the DAO
func main() {
	// Create payload for adding a new member with finance officer role
	payload := basedao.ActionAddMember{
		Address: "g1nqsjex9aguqy062wdrryvvg9u6dn6e9u44dmkm",
		Roles:   []string{"finance-officer"},
	}

	// Wrap payload in a DAO action structure
	action := basedao.NewAddMemberAction(&payload)

	// Create proposal request with metadata and action
	proposal := daokit.ProposalRequest{
		Title:       "Adding new member",
		Description: "Adding new finance-officer member.",
		Action:      action,
	}

	println("Proposal Title:", proposal.Title)
	println("Proposal Description:", proposal.Description)
	println("Action Type:", proposal.Action.Type())
	println("Action String:", proposal.Action.String())

	// Submit the proposal to our DAO
	mydao.Propose(proposal)

}
