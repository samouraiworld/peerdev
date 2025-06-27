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
var Posts []Post = []Post{
	{
		Title:     "First Post",
		Content:   "Welcome to my blog!",
		Author:    std.Address("g1authoraddress123"),
		CreatedAt: time.Now(),
	},
	{
		Title:     "Second Post",
		Content:   "This is another post.",
		Author:    std.Address("g1authoraddress456"),
		CreatedAt: time.Now(),
	},
}

// Render displays all posts in a readable format.
func Render(_ string) string {
	var result string
	for _, post := range Posts {
		result += "Title: " + post.Title + "\n\n"
		result += "Content: " + post.Content + "\n\n"
		result += "Author: " + post.Author.String() + "\n\n"
		result += "Time: " + post.CreatedAt.Format(time.DateTime) + "\n\n"
		result += "-------------------------\n"
	}
	return result
}
