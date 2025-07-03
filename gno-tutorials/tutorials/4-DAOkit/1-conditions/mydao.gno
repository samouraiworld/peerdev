package mydao

import (
	"gno.land/p/samourai/basedao"
	"gno.land/p/samourai/daocond"
	"gno.land/p/samourai/daokit"
	"gno.land/r/demo/profile"
)

var (
	DAO        daokit.DAO
	daoPrivate *basedao.DAOPrivate
)

func init() {
	initialRoles := []basedao.RoleInfo{
		{Name: "Role", Description: "Has a role"},
	}
	initialMembers := []basedao.Member{
		{Address: "g1j9zh3ce7a5tg2esjzherfrx7m3n842k2vmj395", Roles: []string{"Role"}},
		{Address: "g1qkm0xhj8nsm2l3g50ttazxhlq7fs47myhxqk79", Roles: []string{}},
		{Address: "g1nqsjex9aguqy062wdrryvvg9u6dn6e9u44dmkm", Roles: []string{}},
	}
	memberStore := basedao.NewMembersStore(initialRoles, initialMembers)

	// Define the "NoRole" condition
	noRole := NoRole(*memberStore, 1)

	DAO, daoPrivate = basedao.New(&basedao.Config{
		Name:             "Demo DAOKIT DAO",
		Description:      "This is a demo DAO built with DAOKIT",
		Members:          memberStore,
		InitialCondition: noRole,
		GetProfileString: profile.GetStringField,
		SetProfileString: profile.SetStringField,
	})
}

func Vote(cur realm, proposalID uint64, vote daocond.Vote) {
	DAO.Vote(proposalID, vote)
}

func Execute(cur realm, proposalID uint64) {
	DAO.Execute(proposalID)
}

func Propose(cur realm, req daokit.ProposalRequest) {
	DAO.Propose(req)
}

func Render(path string) string {
	return daoPrivate.Render(path)
}
