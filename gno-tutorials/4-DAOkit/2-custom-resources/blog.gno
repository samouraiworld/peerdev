package mydao

type Post struct {
	Title   string
	Content string
}

type Blog struct {
	Post []Post
}

func (a *Blog) NewPost(title string, content string) {
	crossing()

	newPost := Post{
		Title:   title,
		Content: content,
	}
	a.Post = append(a.Post, newPost)
}
