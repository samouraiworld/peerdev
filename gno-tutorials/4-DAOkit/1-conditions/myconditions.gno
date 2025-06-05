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

type noRoleCountCond struct {
	memberStore basedao.MembersStore
	count       uint64
}

func hasNoRole(memberStore basedao.MembersStore, memberId string) bool {
	return memberStore.GetMemberRoles(memberId) == nil
}

func NoRole(memberStore basedao.MembersStore, count uint64) daocond.Condition {
	return &noRoleCountCond{
		memberStore: memberStore,
		count:       count,
	}
}

// Eval implements Condition.
func (c *noRoleCountCond) Eval(ballot daocond.Ballot) bool {
	return c.totalYes(ballot) == 0
}

// Signal implements Condition.
func (c *noRoleCountCond) Signal(ballot daocond.Ballot) float64 {
	return math.Min(float64(c.totalYes(ballot))/float64(c.count), 1)
}

// Render implements Condition.
func (c *noRoleCountCond) Render() string {
	return ufmt.Sprintf("%d", c.count)
}

// RenderWithVotes implements Condition.
func (c *noRoleCountCond) RenderWithVotes(ballot daocond.Ballot) string {
	s := ""
	s += ufmt.Sprintf("to meet the condition, %d members with no role must vote yes\n\n", c.count)
	s += ufmt.Sprintf("Yes: %d/%d\n\n", c.totalYes(ballot), c.count)
	return s
}

// Verify if the condition can be instanciated
// Would cause errors if implementation are invalid
var _ daocond.Condition = (*noRoleCountCond)(nil)

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
