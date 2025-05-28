---
title: DAOkit on Gno.land
theme: ../theme
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🧠 DAOkit on Gno.land

---

Use case

Funding Platform
Treasury [5$]

User 1 [USER]
User 2 [USER]
Administrator [ADMINISTRATOR]

Project [0x01234...]

I want to finance {Project}[3$].
I need at least :
[50% Yes]
✅ Administator approval 

If the condition is satisfied before deadline, the project is satisfied ✅
Otherwise it is closed 🟥


<!--
Example Use Case: A DAO wants to create a proposal to spend money from its treasury.

Rules:

    SpendMoney is a resource with a condition requiring:
        50% approval from the administration board
        Approval from the CFO

Outcome:

    Any user can propose to spend money
    Only board and CFO votes are considered
    The proposal executes only if the condition is satisfied

-->

---

# 🏛️ What is a DAO?

// TODO diagram of DAO


Resource -> func {}
Condition -> func {if (...)}
[Proposals] -> {if Condition (exec Resource)}
[Members] => new Proposal
[Members] -> Roles


---

## 🔑 Key Concepts

- **Proposal**: A request to execute an action within the DAO.
- **Resource**: An executable action triggered through proposals.
- **Condition**: Rules that must be met for a proposal to be executed.
- **Role**: Labels assigned to users granting specific permissions.

<!--
A Decentralized Autonomous Organization (DAO) is a self-governing entity operating through smart contracts
It enables decentralized transparent decision-making.
-->


---
layout: top-title
---
:: title ::
# 🧩 DAOkit Components
:: content ::

## 📦 DAOkit
-> Core package [Proposals, Resource]

## 🧱 basedao
-> Members, Roles

## ⚙️ daocond
-> Conditions

<!--
Core package for building DAOs.
Extension handling membership and roles.
Condition engine for complex proposal requirements.

-->

---
layout: center
---

# 🛠️ Implementing DAOkit

---

# Adding roles and members

```go
initialRoles := []basedao.RoleInfo{
		{Name: "admin", Description: "Admin is the superuser"},
		{Name: "public-relationships", Description: "Responsible of communication with the public"},
		{Name: "finance-officer", Description: "Responsible of funds management"},
	}

initialMembers := []basedao.Member{
	{Address: "g126...zlg", Roles: []string{"admin", "public-relationships"}},
	{Address: "g1ld6...3jv", Roles: []string{"public-relationships"}},
	{Address: "g1r69...0tth", Roles: []string{"finance-officer"}},
	{Address: "g16jv...6e0r", Roles: []string{}},
}
```

---

# 🧪 Code Example: Basic DAO

```go
var (
	DAO        daokit.DAO
	daoPrivate *basedao.DAOPrivate
)

func init() {
	initialRoles := []basedao.RoleInfo{...}
	initialMembers := initialMembers := []basedao.Member{...}

	memberStore := basedao.NewMembersStore(initialRoles, initialMembers)

	condition := daocond.And(
		daocond.MembersThreshold(0.6, memberStore.IsMember, memberStore.MembersCount),
		daocond.RoleCount(1, "finance-officer", memberStore.HasRole),
	)

	DAO, daoPrivate = basedao.New(&basedao.Config{
		Name:             "Demo DAO",
		Description:      "A demo DAO built with DAOkit",
		Members:          memberStore,
		InitialCondition: condition,
	})
}
```

---

# Other function

```go
func init() {
	...
}

func Vote(proposalID uint64, vote daocond.Vote) {
	DAO.Vote(proposalID, vote)
}

func Execute(proposalID uint64) {
	DAO.Execute(proposalID)
}

func Render(path string) string {
	return daoPrivate.Render(path)
}
```

---

## 🧪 daocond

Defines new conditions.

```go
type Condition interface {
	Eval(votes map[string]Vote) bool
	Signal(votes map[string]Vote) float64
	Render() string
	RenderWithVotes(votes map[string]Vote) string
}
```



---

## 🧑‍🤝‍🧑 basedao

Handles members and roles.

```go
type Config struct {
	Name              string
	Description       string
	ImageURI          string
	Members           *MembersStore
	InitialCondition  daocond.Condition
}
```

---

# 🧱 Creating Custom Resources

Implementing custom actions within your DAO.

---

## layout: two-cols

## 📝 Define Action

```go
type ActionNewPost struct {
	Title   string
	Content string
}
```

## ⚙️ Create Handler

```go
func NewPostHandler(blog *Blog) daokit.ActionHandler {
	return daokit.NewActionHandler("NewPost", func(payload interface{}) {
		action := payload.(*ActionNewPost)
		blog.NewPost(action.Title, action.Content)
	})
}
```

---

# 🎯 Use Case: Spending Funds

* **Resource**: SpendMoney
* **Condition**: Requires 50% approval from the administration board and the CFO.
* **Execution**: Proposal is executed only if the condition is met.
