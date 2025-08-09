---
title: Gnolang Transaction Indexer (tx-indexer)
theme: ../../theme
colorSchema: teal
highlight: dracula
highlighter: shiki
fonts:
  sans: Inter
  mono: Fira Code
layout: cover
---

# 🚀 Gnolang Transaction Indexer  

How tx-indexer transforms raw blockchain data  
Into query-friendly structured information

---

# What is a Blockchain Indexer?

<div class="grid grid-cols-2 gap-8">
<div>

### Raw Blockchain Data
```json
{
  "height": 12345,
  "txs": [
    {
      "hash": "0x3F86...D9A1",
      "sender": "g1...abc",
      "receiver": "g1...xyz",
      "amount": "100ugnot"
    }
  ]
}
```
</div>
<div>

### Indexer Transforms Data
```json
{
  "address": "g1...xyz",
  "balance": "250ugnot",
  "tx_count": 5,
  "first_seen": "2025-10-01"
}
```
</div>
</div>

**Indexer = Database + Search Engine for Blockchain**  
Transforms raw chain data into query-friendly format

---

# ⭐ Use Case: Decentralized Social Search

```mermaid
sequenceDiagram
    participant U as User
    participant B as Blockchain
    participant I as Indexer
    participant D as Search dApp
    
    U->>B: Post social content
    B->>I: New block with post
    I->>I: Index tx/metadata
    I->>D: Update search database
    D->>U: Show instant results
```

---

# `tx-indexer` the official TM2 minimalist indexer 

```mermaid {scale: 0.9}
graph LR 
A[Tendermint Chain] --> B(tx-indexer)
B --> C[PebbleDB<br/><small>Embedded Storage</small>r]
B --> D[GraphQL API]
B --> E[JSON-RPC API]
D --> H[Real-time Dashboards]
D --> F[dApps/Explorers]
D --> I[Complex Transaction Queries]
E --> G[Existing Web3 tool integration]
```
- **High Performance**: Concurrent block processing pipeline

---

# Implement data visualizer through `tx-indexer`
### Foo20 - GRC20 basic token visualizer
 

- 1. Create your GraphQL subscription of foo20's transactions
- 2. Parse out useful metrics (amount transfered, block height, ...)
- 3. Pushes those metrics into your data-base (Like Prometheus)
- 4. Your application (Like Grafana) queries that database to display real-time charts


---

# Implement advanced indexer through `tx-indexer`
 
<div style="text-align: center">
```mermaid {scale: 1.5}
graph TD
subgraph my-indexer
tx-indexer
end
```
</div>