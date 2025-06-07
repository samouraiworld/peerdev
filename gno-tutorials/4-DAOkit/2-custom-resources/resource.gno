package mydao

import (
	"errors"

	"gno.land/p/demo/ufmt"
	"gno.land/p/samourai/daokit"
)

// XXX: pkg "/p/samourai/blog" - does not exist, it's just an example
const ActionNewPostKind = "gno.land/p/samourai/blog.NewPost"

type ActionNewPost struct {
	Title   string
	Content string
}

func (m *ActionNewPost) String() string {
	return ufmt.Sprintf("Add member %s with roles %v", m.Title, m.Content)
}
func NewPostAction(title, content string) daokit.Action {
	// def: daoKit.NewAction(kind: String, payload: interface{})
	return daokit.NewAction(ActionNewPostKind, &ActionNewPost{
		Title:   title,
		Content: content,
	})
}

func NewPostHandler(blog *Blog) daokit.ActionHandler {
	// def: daoKit.NewActionHandler(kind: String, payload: func(interface{}))
	return daokit.NewActionHandler(ActionNewPostKind, func(payload interface{}) {
		action, ok := payload.(*ActionNewPost)
		if !ok {
			panic(errors.New("invalid action type"))
		}
		blog.NewPost(action.Title, action.Content)
	})
}
