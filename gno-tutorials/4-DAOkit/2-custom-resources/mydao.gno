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
	blog       Blog
)

func init() {
	initialRoles := []basedao.RoleInfo{
		{Name: "Role", Description: "Has a role"},
	}
	initialMembers := []basedao.Member{
		{Address: "g1j9zh3ce7a5tg2esjzherfrx7m3n842k2vmj395", Roles: []string{}},
		{Address: "g1ld63jv", Roles: []string{}},
		{Address: "g1r690tth", Roles: []string{}},
		{Address: "g16jv6e0r", Roles: []string{}},
	}
	memberStore := basedao.NewMembersStore(initialRoles, initialMembers)
	membersMajority := daocond.MembersThreshold(0.6, memberStore.IsMember, memberStore.MembersCount)

	DAO, daoPrivate = basedao.New(&basedao.Config{
		Name:             "Demo DAOKIT DAO",
		Description:      "This is a demo DAO built with DAOKIT",
		Members:          memberStore,
		InitialCondition: membersMajority,
		GetProfileString: profile.GetStringField,
		SetProfileString: profile.SetStringField,
	})

	//
	// Resources
	//
	resource := daokit.Resource{
		Handler:     NewPostHandler(&blog),
		Condition:   membersMajority,
		DisplayName: "Hello",
		Description: "Description",
	}
	daoPrivate.Core.Resources.Set(&resource)
}

func Vote(proposalID uint64, vote daocond.Vote) {
	DAO.Vote(proposalID, vote)
}

func Execute(proposalID uint64) {
	DAO.Execute(proposalID)
}

func Propose(req daokit.ProposalRequest) {
	DAO.Propose(req)
}

func Render(path string) string {
	return daoPrivate.Render(path)
}
