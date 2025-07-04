# Hello Gno World
Let's create a basic blog realm step by step.

## What is Gno ?

Familiar **syntax** and **standard library**
-  **Deterministic execution**  
-  Built-in **smart contract support**  
-  **No external network access**  
-  **No goroutines** (yet!)

## Blog platform
**Public post feed** 

```go
type Post struct {
    Title     string
    Content   string
    Author    std.Address
    CreatedAt time.Time
}
```


## Useful resources
https://docs.gno.land/resources/effective-gno