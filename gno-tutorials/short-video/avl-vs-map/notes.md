
—-

Explain difference between the two data structures




# 🗺️ Maps in Gno

* **Pros:**

  * Simple syntax and usage
  * Fast access times for small datasets

* **Cons:**

  * Entire dataset loaded into memory
  * Not scalable for large data
  * Can lead to out-of-gas errors

```go
var data = make(map[string]string)
data["key"] = "value"
```


# 🌲 AVL Trees in Gno

* **Pros:**

  * Self-balancing binary search tree
  * Efficient memory usage
  * Suitable for large datasets
  * Deterministic and reproducible

* **Cons:**

  * Slightly more complex implementation
  * O(log n) access times


Performance comparaison


# 🧠 When to Use What?

* **Use Maps when:**

  * Working with small datasets
  * Simplicity is preferred
  * Memory constraints are not an issue

* **Use AVL Trees when:**

  * Dealing with large datasets
  * Scalability and efficiency are required
  * Deterministic behavior is essential


---

# 📚 Further Reading

* [Why use AVL Trees in Gno](https://gno.howl.moe/avl-tree-storage/)
* [Gno AVL Tree Documentation](https://docs.gno.land/resources/glossary)
* [Effective Gno](https://docs.gno.land/resources/effective-gno/)
