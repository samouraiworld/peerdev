// XXX: pkg "/p/samourai/blog" - does not exist, it's just an example
const ActionNewPostKind = "gno.land/p/samourai/blog.NewPost"

type ActionNewPost struct {
	Title string
	Content string
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

func init() {
	resource := daokit.Resource{
	    Condition: daocond.NewRoleCount(1, "CEO", daoPrivate.Members.HasRole),
	    Handler: blog.NewPostHandler(blog),
	}
	daoPrivate.Core.Resources.Set(&resource)
}