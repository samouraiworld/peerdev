# Hello Gno World Tutorial - Blog Implementation

This tutorial introduces you to Gno (Gnolang) and guides you through building your first decentralized application - a public blog platform.

## What is Gno?
Gno is a smart contract language that:
- Maintains Go-like syntax and standard libraries
- Runs deterministically in blockchain environments
- Prioritizes security and auditability
- Enables building decentralized applications (dApps)

### Key Differences from Go
| Feature          | Go        | Gno        |
|------------------|-----------|------------|
| Execution        | General   | Deterministic |
| Concurrency      | Goroutines| ❌ Not available (yet) |
| Network Access   | ✅ Yes    | ❌ Restricted |
| File I/O         | ✅ Yes    | ❌ Restricted |
| Blockchain Access| ❌ No     | ✅ Native  |

## Building a Public Blog Platform
We'll create a decentralized blogging application where anyone can post messages to a public feed.

### Core Data Structure
```go
type Post struct {
    Title     string
    Content   string
    Author    std.Address
    CreatedAt time.Time
}
```

## Implementation Guide

### 1. Initialize the Blog Realm
```go
package blog

import (
    "std"
    "time"
)

// Global list to store all posts
var Posts []Post
```

### 2. Add Post Creation Function
```go
func CreatePost(cur realm, title, content string) {
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
```

### 3. Add Render Function for Display
```go
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
```

## Key Development Principles

### 1. Embrace Global State
```go
// Global state is accessible to all functions
var Posts []Post

func CreatePost(...) {
    // Modify global state directly
    Posts = append(Posts, newPost)
}
```

### 2. Fail Fast with Panic
```go
func CreatePost(...) {
    if title == "" {
        panic("No title") // Fail immediately on invalid input
    }
    // ...
}
```

### 3. Prioritize Readability
```go
// Good: Clear, descriptive names
func CalculateUserReward(user std.Address) int

// Avoid: Cryptic abbreviations
func CalcUsrRwrd(u std.Address) int
```

## Testing our realm

# Comprehensive Testing Guide for Gno Smart Contracts

Testing is a critical part of smart contract development. This guide covers Gno's testing framework and best practices for ensuring your contracts are secure and reliable.

### Naming Convention
- Test files must end with `_test.gno`
- Test files reside in the same package as the contract

```bash
blog.gno         # Main contract
blog_test.gno    # Test file
```

### Test Function Requirements
1. **Public Function**: Name must start with a capital letter
2. **Parameter**: Must accept `t *testing.T` as first parameter
3. **Naming**: Should start with `Test` followed by descriptive name

```go
// Correct test function
func TestCreatePost(t *testing.T) {
    // Test logic
}

// Incorrect (will not run)
func testCreatePost(t *testing.T) {}      // Not public
func TestCreatePost() {}                  // Missing testing.T parameter
func TestCreatePost(t *test.T) {}         // Wrong type
```

## Test Execution

Run all tests in a package:
```bash
gno test
```

Run specific tests:
```bash
gno test -run TestCreatePost
```

Verbose output with test timing:
```bash
gno test -v
```

## Exercise: Add Comment Feature
Extend the blog to allow comments on posts.

## Resources
- [Gno Documentation](https://docs.gno.land)
- [Gno Playground](https://play.gno.land)
- [Gno GitHub Repository](https://github.com/gnolang/gno)
- [Example Contracts](https://gno.land/r/demo)