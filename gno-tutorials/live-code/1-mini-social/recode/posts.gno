package minisocial

import (
	"chain/runtime"
	"strconv"

	"gno.land/p/moul/md"
	"gno.land/p/nt/avl"
	"gno.land/p/nt/avl/pager"
	"gno.land/p/nt/seqid"
	"gno.land/p/nt/ufmt"
)

var (
	postID seqid.ID
	posts  = avl.NewTree()
	pag    = pager.NewPager(posts, 5, true)
)

func CreatePost(_ realm, title string, content string) {
	if title == "" {
		panic("CreatePost: invalid title")
	}
	id := postID.Next()
	post := Post{
		id:      id,
		title:   title,
		content: content,
		author:  runtime.PreviousRealm().Address(),
	}

	posts.Set(id.String(), &post)
}

func DeletePost(_ realm, id string) {
	raw, ok := posts.Get(id)
	if !ok {
		panic("DeletePost: Post not found")
	}

	post := raw.(*Post)
	if runtime.PreviousRealm().Address() != post.author {
		panic("DeletePost: Unauthorized")
	}

	posts.Remove(id)
}

func UpdatePost(_ realm, id string, content string) {
	raw, ok := posts.Get(id)
	if !ok {
		panic("UpdatePost: Post not found")
	}

	post := raw.(*Post)
	if runtime.PreviousRealm().Address() != post.author {
		panic("UpdatePost: Unauthorized")
	}

	post.content = content
}

func Render(path string) string {
	out := md.H1("MiniSocial")
	if posts.Size() == 0 {
		out += "No posts yet!\n\n"
		return out
	}

	if path == "?hello" {
		return "hello world"
	}
	page := pag.MustGetPageByPath(path)

	for _, item := range page.Items {
		post := item.Value.(*Post)

		out += md.H4(ufmt.Sprintf("Post #%d\n\n", int(post.id)))

		out += post.String()
		out += md.HorizontalRule()
	}

	out += page.Picker(path)
	out += "\n\n"
	out += "Page " + strconv.Itoa(page.PageNumber) + " of " + strconv.Itoa(page.TotalPages) + "\n\n"

	return out
}
