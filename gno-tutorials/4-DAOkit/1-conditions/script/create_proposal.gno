package main

import (
	"gno.land/p/samourai/basedao"
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/mydao"
)

func main() {
	payload := basedao.ActionAddMember{
		Address: "g1j9zh3ce7a5tg2esjzherfrx7m3n842k2vmj395",
		Roles:   []string{},
	}
	action := basedao.NewAddMemberAction(&payload)

	proposal := daokit.ProposalRequest{
		Title:       "Adding new member",
		Description: "Adding new member with no role",
		Action:      action,
	}

	mydao.Propose(proposal)

}
