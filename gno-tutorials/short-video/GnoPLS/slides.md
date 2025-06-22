---
title: Gnopls - LSP for Gno
theme: ../../theme
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🧩 Gnopls
## Language Server Protocol for Gno

Bringing IDE capabilities to Gno development

<!-- 
Focus on:
- What LSP brings to developers
- Gno-specific tooling features
-->

---
layout: top-title
color: blue
---

:: title ::
# 🤔 What is LSP?
:: content ::

**Language Server Protocol (LSP)** is an open standard created by Microsoft
- Enables **rich code editing features** in any editor
- **Decouples** language intelligence from editor implementation
- Supported by VS Code, Neovim, Emacs, Sublime, etc.

**Key capabilities:**
- Code completion
- Error checking
- Go-to-definition
- Refactoring tools
- Documentation on hover

---
layout: top-title
color: green
---

:: title ::
# 🚀 What is Gnopls?
:: content ::

**Gnopls** is the official LSP implementation for Gno
- Built specifically for **Gno.land ecosystem**
- Based on **Gopls**
- Provides **smart code analysis** for `.gno` files

**Core architecture:**
- Written in Go
- Editor-agnostic implementation
