package vote

import (
	"std"
	"time"
)

func TestCreatePublicProposal() {
	// Setup roles
	roles := map[std.Address]Role{
		std.Address("addr1"): 1, // Admin
	}

	// Add dummy action and condition
	actionID := CreateAction(
		"Test Action",
		"A test action",
		func(interface{}) {},
		nil,
	)
	conditionID := CreateCondition(
		"Test Condition",
		"A test condition",
		func(interface{}) bool { return true },
		nil,
	)

	// Call CreatePublicProposal
	CreatePublicProposal(
		"Test Proposal",
		"This is a test proposal.",
		time.Now().Add(24*time.Hour),
		actionID,    // actionID
		conditionID, // conditionID
		roles,
	)

	// Check proposal was created
	if proposals.Len() != 1 {
		panic("Proposal was not created.")
	}
	p := proposals.Get(0).(*Proposal)
	if p.Title != "Test Proposal" {
		panic("Proposal title mismatch.")
	}
}
