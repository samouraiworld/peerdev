# Create Your First dApp on Gno.land: Build Your Home Realm 🏠

- Create and personalize your own Home Realm on Gno.land  
- Deploy a simple decentralized application (dApp)  
- Learn to interact with and test your realm    
- Publish your realm in the Hall of Realms  

## Introduction

In this session, you’ll learn how to build your own Home Realm — a personalized, on-chain space that reflects your creativity and personality. You will deploy a simple dApp, explore core concepts of the Gno.land ecosystem, and learn how to test, publish, and share your realm with the wider community.

By the end of this guide, you’ll have a functioning realm deployed and the knowledge to continue experimenting and building on Gno.land.

> **Note**: During this workshop, we will use the **latest testnet network** (**Test 7** as of today). If any part seems unusual or broken, don't hesitate to ask questions in the [Official Discord server](https://discord.com/invite/ubN5NXaMYZ) and create issues in this repositories!
We are available there to answer any question.

## Step 0 - Prerequisites & Setup

Before diving into realm creation, we need to ensure your development environment is properly configured for Gno.land development.

**Gno.land** is a blockchain platform that enables developers to build decentralized applications using **Gnolang** (Gno), a deterministic variant of the Go programming language. Unlike traditional smart contract platforms, Gno.land emphasizes **code readability**, **composability**, and **transparency** by making all code human-readable on-chain. The platform features "**realms**" - smart contracts that maintain state and can interact with each other, and "**pure packages**" - reusable libraries that provide code without maintaining state, enabling developers to share common utilities, data structures, and algorithms across the ecosystem. It enables a **composable ecosystem** where developers can build upon existing functionality. With its focus on simplicity and developer experience, Gno.land aims to make blockchain development more accessible while maintaining the security and decentralization benefits of distributed systems.
    
### Installation & Environment Setup
- Installing the Gno toolchain
- Setting up your development environment
- Running `gnodev` for local development
- Create your first keypair:
    - [Gnokey](https://docs.gno.land/users/interact-with-gnokey) - CLI Wallet
    - [Adena Wallet](https://www.adena.app/) - Browser Extension Wallet
- Setup IDE extension through `Gnopls`

The next guides will help you through this tasks:

### 📺 Watch:
- [Setup local environment](https://www.youtube.com/watch?v=C8RuA_uU3Fs) - [README](https://github.com/samouraiworld/peerdev/tree/main/gno-tutorials/tutorials/1-initialisation)
- [Extend your IDE capabilities with Gnopls](https://www.youtube.com/watch?v=-byuFoVYp30) - [README](https://github.com/samouraiworld/peerdev/blob/main/gno-tutorials/short-tutorials/5-GnoPLS/sources.md)
    
> 💡 **Tip**: We recommend watching these videos and attempting to run the basic examples. They are made to be efficient and updated. This will help you get the most out of our explanation through live session! 

### 📚 Documentation:
- [What is Gno?](https://docs.gno.land/builders/what-is-gnolang)
- [Anatomy of a Gno Package](https://docs.gno.land/builders/anatomy-of-a-gno-package)
- [Local dev with Gnodev](https://docs.gno.land/builders/local-dev-with-gnodev)
- [Interact with Gnokey](https://docs.gno.land/users/interact-with-gnokey)
- [Adena Wallet](https://www.adena.app/)

## Step 1 - What is a Home Realm?

- A **Realm** is a smart contract on Gno.land that can store data and run code. Think of it like a mini-application that lives on the blockchain.

- A **Home Realm** is your personal space on Gno.land. It's like having your own webpage on the blockchain where you can build whatever you want - a simple profile, a game, or anything that shows your personality.

### **Examples & Inspirations:**
- [Hall of Realm](https://gno.land/r/leon/hor)
- [Sacha Home Realm](https://gno.land/r/sacha/home)
- [Leon Home Realm](https://gno.land/r/leon/home)
- [Gnomaze](https://gno.land/r/gfanton/gnomaze)
- [Miko's Calculator](https://gno.land/r/miko/calculator)
    
### 📺 Watch:
- [Interactive Documentation - /r/docs](https://www.youtube.com/watch?v=zpGxMQo3V-o)

### 📚 Documentation:
- [Understanding Gno Packages](https://docs.gno.land/resources/gno-packages)

## Step 2 - Claim Your Username & Get Test Tokens

Before building your realm, you need:
1. **A username** on Gno.land 
2. **Test tokens** to deploy your realm

### Get Test Tokens
- Visit: [faucet.gno.land](https://faucet.gno.land/)
- Set your wallet address
- Request tokens

### Register Username
- Visit: [gno.land/r/gnoland/users](https://test7.testnets.gno.land/r/gnoland/users)
- Choose a unique username (lowercase, no special characters)
- Register using your wallet

### 📺 Watch:
- [Username Registration Guide](https://www.youtube.com/watch?v=R5t1GmBRUVk)

## Step 3 - Live Coding: Build Your First Realm

Now for the exciting part! Let's build your first Home Realm step by step. We'll create a simple but functional realm that you can personalize and expand upon.

Let's start by creating the proper structure for your **Home Realm project**:

### **Initialize the Gno Module**
```sh
gno mod init gno.land/r/[your-username]/home
```

This creates a `gnomod.toml`. You should also create a `home.gno` files.
```
├── gnomod.toml      # Module configuration (auto-generated)
└── home.gno         # Your main realm code 
```

### `gnomod.toml` Configuration

`gnomod.toml` is the configuration file for your realm.

```toml
module = "gno.land/r/[your-username]/home" 
gno = "0.9"
```

> 💡 **Important**: Replace `[your-username]` with your actual username

One interesting *to come* configuration field is `private`.
It marks the package as unimportable by any other package, and can be re-uploaded as many time - the new version fully overwriting the old one.
It is used for packages meant to be changed, such as the **home** realm of a specific user.
So keep it in minds when it is released!

### 📚 Documentation:
- [Configuring Gno Projects](https://docs.gno.land/resources/configuring-gno-projects/)

### `home.gno` Realm

#### Essential Functions
- **`Render()`** - How your realm displays content (like a web page)
- **`init()`** - Setting up your realm when it's first deployed
- **Public functions** - Let users call that function through transactions to your realm

> 💡 **Tip**: A function become Public in Go/Gno when its first letter is in **U**ppercase.

#### Authentication & Security
- **`std.CurrentRealm().Address()`** - Getting your realm's identity
- **`std.GetOrigCaller()`** - Knowing who is calling your functions
- **Access control** - Making sure only you can update certain things

> 💡 **Tip**: You can test your home realm in Gnoweb using `gnodev /path/to/your/realm/directory`. 

### 📚 Documentation:
- [Standard Libraries](https://docs.gno.land/resources/gno-stdlibs)

## Step 4 - Testing Your Realm

Testing is crucial to ensure your realm works correctly before deploying it to the blockchain (Especially in **immutable programming** like it is often in blockchain programming). 
You should test ideally **every functions** and their **edge cases**. 
They should be executed after modification. It is also a good practice to ensure gas usage isn't too expensive.

```bash
# Run tests for your realm
gno test /path/to/your/realm/directory
```

### 📺 Watch:
- [Build and test your first dApp](https://www.youtube.com/watch?v=nzo6QgxQHgw&t=161s)

### 📚 Documentation:
- [Running & testing Gno code](https://docs.gno.land/resources/gno-testing)

## Step 5 - Go Further: Explore More Packages 

Now that you have a basic Home Realm, let's enhance it with powerful packages and add interactive elements! 

**You are now autonomous** to build whatever sparks your creativity. **Experiment, play, and iterate** until you've created something that you feel proud of! 
Everything possible in Go **is also possible in Gno**, so take inspiration from existing sources.

### 📚 Documentation:
- [SVG Generation Library](https://gno.land/p/demo/svg)
- [Svg Buttons](https://gno.land/p/leon/svgbtn)
- [ASCII UI Elements](https://gno.land/p/lou/ascii)
- [Art Examples](https://gno.land/r/demo/art)

## Step 6 - Save Your Realm in the Hall of Realms (HOR)

Let's deploy your realm to Gno.land and register it in the [**Hall of Realms**](https://test7.testnets.gno.land/r/leon/hor) 👑 so the entire community can discover and interact with your creation.

Simply import the Hall of Realms in your code, and call the `Register()` function inside your realm `init()`, as shown below:
```go
package myrealm

import `gno.land/r/leon/hor`

func init() {
	hor.Register(cross, `My Gnome App`, `This is my submission to the Hall of Realms.`)
}
```

And then deploy your realm using the `maketx addpkg` command by following the next guides.

If done correctly, it should appear in the [Hall](https://test7.testnets.gno.land/r/leon/hor:hall).

### 📺 Watch:
- [Deploying Gno Packages](https://www.youtube.com/watch?v=B7bSreCwIls)

### 📚 Documentation:
- [Deploying Gno Packages](https://docs.gno.land/builders/deploy-packages)

> 💡 **Note**: Be mindful to always interact with the same network, so `test7.testnets.gno.land`

## Step 7 - Conclusion & Wrap-Up

Congratulations on coding your first Gno.land realm! You learn the basic of Gno programmation by creating your **Home Realm**.
Let's consolidate your learning in the Gno.land ecosystem by reading the next guides about **Effective Programmation** in Gno:

### 📺 Watch:
- [Effective programming in Gno](https://www.youtube.com/watch?v=UNJSuMdjTFA)

### 📚 Documentation:
- [Effective Gno](https://docs.gno.land/resources/effective-gno/)

### Don't forget to share your realm with the community and inspire the next generation of builders! 🥷

# Made with ❤️ by:
- [David](https://github.com/Davphla)
- [Moonia](https://github.com/moonia)