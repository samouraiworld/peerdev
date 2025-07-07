# Hello Gno World
Let's create a basic blog realm step by step.

## What is Gno ?

Familiar **syntax** and **standard library**
-  **Deterministic execution**  
-  Built-in **smart contract support**  
-  **No external network access**  
-  **No goroutines** (yet!)

## Blog platform

It will be constituted of a list of Post.
They will be displayed by returning a string in the `Render` function.

Public post structure:
```go
type Post struct {
    Title     string
    Content   string
    Author    std.Address
    CreatedAt time.Time
}
```
List of Posts:
```go
var Posts []Post
```

The full example is available in the directory `1-blog`.

## Exercise
On the blog, add a `Comment` feature allowing you to add a comment on a specific post, refered by its ID.

## Useful resources
https://docs.gno.land/resources/effective-gno