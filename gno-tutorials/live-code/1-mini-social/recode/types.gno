package minisocial

import (
	"gno.land/p/nt/seqid"
	"gno.land/p/nt/ufmt"
	"gno.land/r/sys/users"
)

type Post struct {
	id      seqid.ID
	title   string
	content string
	author  address
}

func (p Post) String() string {
	out := "## " + p.title + "\n\n"

	out += p.content + "\n\n"

	author := p.author.String()
	user := users.ResolveAddress(p.author)
	if user != nil {
		author = user.RenderLink("")
	}

	out += ufmt.Sprintf("_by %s\n\n", author)
	return out
}
