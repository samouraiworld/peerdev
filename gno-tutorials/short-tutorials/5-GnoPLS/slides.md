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

# Gnopls
## Language Server Protocol for Gno

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
# Language Server Protocol (LSP)
:: content ::

Open standard created by Microsoft
- Enables **rich code editing features** in any editor
- **Decouples** language intelligence from editor implementation
- Supported by most code editor

<!--
VS Code, Neovim, Emacs, Sublime, etc.

**Key capabilities:**
- Code completion
- Error checking
- Go-to-definition
- Refactoring tools
- Documentation on hover
-->

---
layout: top-title
color: green
---

:: title ::
# Gnopls
:: content ::

**Gnopls** is the official LSP implementation for Gno
- Based on **Gopls**
- Provides **smart code analysis** for `.gno` files

<!--
**Core architecture:**
- Written in Go
-->