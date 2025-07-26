package minisocial

import (
	"errors"
	"std"
	"strconv"
	"time"

	"gno.land/p/demo/avl"
	"gno.land/p/demo/avl/pager"
	"gno.land/p/demo/seqid"
	"gno.land/p/demo/ufmt"
	"gno.land/p/moul/md"
)

type Post struct {
	id        seqid.ID
	content   string
	author    std.Address
	createdAt time.Time
	editedAt  time.Time
}

var (
	postID seqid.ID
	posts  = avl.NewTree()
	pag    = pager.NewPager(posts, 5, true)

	NoContentPost   = errors.New("CreatePost called with no content")
	InvalidPost     = errors.New("EditPost Invalid ID")
	ErrUnauthorized = errors.New("EditPost You're not authorized to edit this post")
)

// Create a new post objcect with a content
func CreatePost(cur realm, content string) error {
	if content == "" {
		return NoContentPost
	}

	id := postID.Next()

	post := &Post{
		id:        id,
		content:   content,
		author:    std.OriginCaller(),
		createdAt: time.Now(),
		editedAt:  time.Now(),
	}

	posts.Set(id.String(), post)
	return nil
}

func EditPost(cur realm, id seqid.ID, newContent string) error {
	raw, isValid := posts.Get(id.String())

	if !isValid {
		return InvalidPost
	}

	post := raw.(*Post)

	if post.author != std.OriginCaller() {
		return ErrUnauthorized
	}
	post.content = newContent
	return nil
}

func DeletePost(cur realm, id seqid.ID) error {
	raw, isValid := posts.Get(id.String())

	if !isValid {
		return InvalidPost
	}

	post := raw.(*Post)

	if post.author != std.OriginCaller() {
		return ErrUnauthorized
	}
	posts.Remove(id.String())
	return nil
}

func Render(path string) string {
	out := md.H1("My blog")
	if postID == 0 {
		out += "No post available\n"
		return out
	}
	page := pag.MustGetPageByPath(path)

	for _, item := range page.Items {
		post := item.Value.(*Post)
		out += md.H4(ufmt.Sprintf("Post #%d - %s %s\n\n", int(post.id), post.content, post.author))
		out += md.HorizontalRule()
	}

	out += page.Picker(path)
	out += "\n\n"
	out += "Page " + strconv.Itoa(page.PageNumber) + " of " + strconv.Itoa(page.TotalPages) + "\n\n"

	return out
}
