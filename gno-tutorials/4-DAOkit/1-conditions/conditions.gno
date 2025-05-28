type Condition interface {
    Eval(votes map[string]Vote) bool
    Signal(votes map[string]Vote) float64
    Render() string
    RenderWithVotes(votes map[string]Vote) string
}
