package blog

import (
	"strings"
	"testing"

	"gno.land/p/demo/testutils"
)

func TestAddPost(t *testing.T) {
	// Get a test address for alice
	aliceAddr := testutils.TestAddress("alice")

	// TestSetRealm sets the realm caller, in this case Alice
	testing.SetRealm(testing.NewUserRealm(aliceAddr))

	// Content for our new post
	title := "Hello World!"
	content := "My first post. I hope you like it."

	CreatePost(cross, title, content)

	// Get the rendered page
	got := Render("")

	// Content should have the data and alice's address in it
	if !(strings.Contains(got, title) && strings.Contains(got, content) && strings.Contains(got, aliceAddr.String())) {
		t.Fatal("expected render to contain text & alice's address")
	}
}

// It is not possible anymore to recover after defer from a cross function
func TestCreatePostPanic(t *testing.T) {
	// defer func() {
	// 	// r should contain panic error
	// 	if r := recover(); r == nil {
	// 		t.Fatal("expected CreatePost to panic, but it did not")
	// 	}
	// }()

	// Attempt to create a post with an empty title (invalid state)
	title := ""
	content := "No title available."

	// should panic
	abort := revive(func() { CreatePost(cross, title, content) })
	if abort != "No title" {
		t.Fatal("expected CreatePost to panic, but it did not")
	}
}
