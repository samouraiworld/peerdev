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
		{Name: "admin", Description: "Admin is the superuser"},
		{Name: "public-relationships", Description: "Responsible of communication with the public"},
		{Name: "finance-officer", Description: "Responsible of funds management"},
	}

	initialMembers := []basedao.Member{
		{Address: "g1j9zh3ce7a5tg2esjzherfrx7m3n842k2vmj395", Roles: []string{"admin", "public-relationships"}},
		{Address: "g1qkm0xhj8nsm2l3g50ttazxhlq7fs47myhxqk79", Roles: []string{"public-relationships"}},
		{Address: "g1nqsjex9aguqy062wdrryvvg9u6dn6e9u44dmkm", Roles: []string{"finance-officer"}},
		{Address: "g1cxqkkdydlsgs5486cdzp3amczy2w88l58hhp9v", Roles: []string{}},
	}

	memberStore := basedao.NewMembersStore(initialRoles, initialMembers)

	membersMajority := daocond.MembersThreshold(0.6, memberStore.IsMember, memberStore.MembersCount)
	publicRelationships := daocond.RoleCount(1, "public-relationships", memberStore.HasRole)
	financeOfficer := daocond.RoleCount(1, "finance-officer", memberStore.HasRole)

	// `and` and `or` use va_args so you can pass as many conditions as needed
	adminCond := daocond.And(membersMajority, publicRelationships, financeOfficer)

	DAO, daoPrivate = basedao.New(&basedao.Config{
		Name:             "Demo DAOKIT DAO",
		Description:      "This is a demo DAO built with DAOKIT",
		Members:          memberStore,
		InitialCondition: adminCond,
		GetProfileString: profile.GetStringField,
		SetProfileString: profile.SetStringField,
	})
}

func Vote(proposalID uint64, vote daocond.Vote) {
	crossing()
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
