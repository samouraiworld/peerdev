package blog

import (
	"std"
	"time"
)

// Post represents a single blog entry.
type Post struct {
	Title     string
	Content   string
	Author    std.Address
	CreatedAt time.Time
}

// Global list to store all posts.
var Posts []Post

// CreatePost appends a new post to the Posts list.
// Title should present.
func CreatePost(title, content string) {
	// Necessary when calling our contract from another space
	crossing()

	if title == "" {
		panic("No title")
	}

	newPost := Post{
		Title:     title,
		Content:   content,
		Author:    std.OriginCaller(),
		CreatedAt: time.Now(),
	}
	Posts = append(Posts, newPost)
}

// Init function is executed during realm initialization]
func init() {}

// Render displays all posts in a readable format.
func Render(_ string) string {
	var result string
	if len(Posts) == 0 {
		return "No posts"
	}
	for _, post := range Posts {
		result += "# Title: " + post.Title + "\n\n"
		result += "Content: " + post.Content + "\n\n"
		result += "Author: " + post.Author.String() + "\n\n"
		result += "Time: " + post.CreatedAt.Format(time.DateTime) + "\n\n"
		result += "-------------------------\n\n"
	}
	return result
}
