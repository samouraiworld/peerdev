// type Condition interface {
//     Eval(votes map[string]Vote) bool
//     Signal(votes map[string]Vote) float64
//     Render() string
//     RenderWithVotes(votes map[string]Vote) string
// }

package mydao

import (
	"gno.land/p/demo/ufmt"
	"gno.land/p/samourai/basedao"
	"gno.land/p/samourai/daocond"

	"math"
)

// Implements a custom DAO condition requiring votes from members with no assigned roles
type noRoleCountCond struct {
	memberStore basedao.MembersStore // Access to DAO membership data
	count       uint64               // Required number of yes votes from roleless members
}

// NoRole creates a new condition requiring votes from members with no roles
func NoRole(memberStore basedao.MembersStore, count uint64) daocond.Condition {
	return &noRoleCountCond{
		memberStore: memberStore,
		count:       count,
	}
}

// Checks if a member has no assigned roles
func hasNoRole(memberStore basedao.MembersStore, memberId string) bool {
	return memberStore.GetMemberRoles(memberId) == nil
}

// Counts valid "yes" votes from roleless members
func (c *noRoleCountCond) totalYes(ballot daocond.Ballot) uint64 {
	totalYes := uint64(0)
	ballot.Iterate(func(voter string, vote daocond.Vote) {
		if vote != daocond.VoteYes {
			return
		}
		if !hasNoRole(c.memberStore, voter) {
			return
		}
		totalYes += 1
	})
	return totalYes
}

// Eval evaluates whether the condition is satisfied based on current votes
// Returns true when at least 'count' roleless members have voted yes
func (c *noRoleCountCond) Eval(ballot daocond.Ballot) bool {
	return c.totalYes(ballot) >= c.count
}

// Signal calculates the completion progress of the condition (0.0 to 1.0)
// Represents the ratio of actual yes votes to required count, capped at 1.0
func (c *noRoleCountCond) Signal(ballot daocond.Ballot) float64 {
	return math.Min(float64(c.totalYes(ballot))/float64(c.count), 1)
}

// Displays the condition requirements for UI purposes
func (c *noRoleCountCond) Render() string {
	return ufmt.Sprintf("%d", c.count)
}

// Generates a detailed vote status report
func (c *noRoleCountCond) RenderWithVotes(ballot daocond.Ballot) string {
	s := ""
	s += ufmt.Sprintf("to meet the condition, %d members with no role must vote yes\n\n", c.count)
	s += ufmt.Sprintf("Yes: %d/%d\n\n", c.totalYes(ballot), c.count)
	return s
}

// Verify the interface compliance
// Ensures proper implementation
var _ daocond.Condition = (*noRoleCountCond)(nil)
