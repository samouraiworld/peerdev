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

// Initializes the DAO with predefined roles, members, and governance rules.
func init() {
	// Define initial roles in the DAO
	initialRoles := []basedao.RoleInfo{
		{Name: "admin", Description: "Admin is the superuser"},
		{Name: "public-relationships", Description: "Responsible of communication with the public"},
		{Name: "finance-officer", Description: "Responsible of funds management"},
	}

	// Define initial members and their roles
	initialMembers := []basedao.Member{
		{Address: "g1j9zh3ce7a5tg2esjzherfrx7m3n842k2vmj395", Roles: []string{"admin", "public-relationships"}},
		{Address: "g1qkm0xhj8nsm2l3g50ttazxhlq7fs47myhxqk79", Roles: []string{"public-relationships"}},
		{Address: "g1cxqkkdydlsgs5486cdzp3amczy2w88l58hhp9v", Roles: []string{}},
	}

	memberStore := basedao.NewMembersStore(initialRoles, initialMembers)

	// Define governance conditions using daocond
	membersMajority := daocond.MembersThreshold(0.6, memberStore.IsMember, memberStore.MembersCount)
	publicRelationships := daocond.RoleCount(1, "public-relationships", memberStore.HasRole)
	// Combine conditions: requires all conditions to pass
	adminCond := daocond.And(membersMajority, publicRelationships)

	// Initialize DAO with configuration
	DAO, daoPrivate = basedao.New(&basedao.Config{
		Name:             "Simple DAO",
		Description:      "",
		Members:          memberStore,
		InitialCondition: adminCond,
		GetProfileString: profile.GetStringField,
		SetProfileString: profile.SetStringField,
	})
}

// Vote allows DAO members to cast their vote on a specific proposal
func Vote(proposalID uint64, vote daocond.Vote) {
	crossing()
	DAO.Vote(proposalID, vote)
}

// Execute triggers the implementation of a proposal's actions
func Execute(proposalID uint64) {
	crossing()
	DAO.Execute(proposalID)
}

// Execute triggers the implementation of a proposal's actions
func Propose(req daokit.ProposalRequest) {
	DAO.Propose(req)
}

// Render generates a UI representation of the DAO's state
func Render(path string) string {
	return daoPrivate.Render(path)
}
