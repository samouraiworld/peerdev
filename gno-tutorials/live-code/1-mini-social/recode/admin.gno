package minisocial

import (
	"gno.land/p/nt/avl"
	"gno.land/p/nt/avl/pager"
	"gno.land/p/nt/ownable"
	"gno.land/p/nt/seqid"
)

var Ownable = ownable.NewWithAddress("g12nla47jqlqcu45smqm3wdsjmdwdzyrgvku6wyy")

func ResetPosts(_ realm) {
	Ownable.AssertOwnedByPrevious()
	posts = avl.NewTree()
	postID = seqid.ID(0)
	pag = pager.NewPager(posts, 5, true)
}
