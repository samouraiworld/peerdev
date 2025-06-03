// type Condition interface {
//     Eval(votes map[string]Vote) bool
//     Signal(votes map[string]Vote) float64
//     Render() string
//     RenderWithVotes(votes map[string]Vote) string
// }

package conditions

import (
	"gno.land/p/demo/ufmt"
	"gno.land/p/samourai/daocond"

	"errors"
	"math"
)

type roleCountCond struct {
	hasRoleFn func(memberId string, role string) bool
	count     uint64
	role      string
}

func RoleCount(count uint64, role string, hasRoleFn func(memberId string, role string) bool) daocond.Condition {
	if count == 0 {
		panic(errors.New("count must be greater than 0"))
	}
	if role == "" {
		panic(errors.New("role must not be empty"))
	}
	if hasRoleFn == nil {
		panic(errors.New("nil hasRoleFn"))
	}
	return &roleCountCond{
		count:     count,
		hasRoleFn: hasRoleFn,
		role:      role,
	}
}

// Eval implements Condition.
func (c *roleCountCond) Eval(ballot daocond.Ballot) bool {
	return c.totalYes(ballot) >= c.count
}

// Signal implements Condition.
func (c *roleCountCond) Signal(ballot daocond.Ballot) float64 {
	return math.Min(float64(c.totalYes(ballot))/float64(c.count), 1)
}

// Render implements Condition.
func (c *roleCountCond) Render() string {
	return ufmt.Sprintf("%d %s", c.count, c.role)
}

// RenderWithVotes implements Condition.
func (c *roleCountCond) RenderWithVotes(ballot daocond.Ballot) string {
	s := ""
	s += ufmt.Sprintf("to meet the condition, %d members with role %s must vote yes\n\n", c.count, c.role)
	s += ufmt.Sprintf("Yes: %d/%d\n\n", c.totalYes(ballot), c.count)
	return s
}

var _ daocond.Condition = (*roleCountCond)(nil)

func (c *roleCountCond) totalYes(ballot daocond.Ballot) uint64 {
	totalYes := uint64(0)
	ballot.Iterate(func(voter string, vote daocond.Vote) {
		if vote != daocond.VoteYes {
			return
		}
		if !c.hasRoleFn(voter, c.role) {
			return
		}
		totalYes += 1
	})
	return totalYes
}
