# [TX-indexer](https://github.com/gnolang/tx-indexer)

## Getting Started

This section guides you through setting up and running the `tx-indexer`.

1. **Clone the Repository**

```shell
git clone https://github.com/gnolang/tx-indexer.git
```

2. **Build the binary**

```bash
cd tx-indexer
make build
```

3. **Run the indexer**

```bash
./build/tx-indexer start --remote https://rpc.test6.testnets.gno.land --db-path indexer-db
```

or:

```bash
go run cmd/main.go cmd/start.go cmd/waiter.go start --remote https://rpc.test6.testnets.gno.land --db-path indexer-db
```

The `--remote` flag specifies the JSON-RPC URL of the chain the indexer should index, and the `--db-path` specifies the
on-disk location for the indexed data.

**Note**: the websocket endpoint exposed is always: `ws://<listen-address>/ws`
