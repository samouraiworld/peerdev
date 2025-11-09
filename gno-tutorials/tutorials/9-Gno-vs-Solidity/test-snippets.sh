#!/usr/bin/env bash

set -e

# Simple snippet tester for Gno vs Solidity
# Usage: ./test-snippets.sh [snippet-number] [language: sol|gno]
# Examples:
#   ./test-snippets.sh 1 gno
#   ./test-snippets.sh 7 sol

snippets=(
    "counter"
    "erc20-grc20" 
    "events"
    "factory"
    "guardcheck"
    "mapping"
    "ownable"
    "emergency"
    "proxy"
    "reentrancy"
    "speedbump"
    "statelock"
    "wallet-deposit"
    "wallet-withdraw"
    "private-vs-public"
)

# Show menu if no args
if [ $# -eq 0 ]; then
    echo "Available Snippets:"
    for i in "${!snippets[@]}"; do
        echo "  $((i+1)). ${snippets[$i]}"
    done
    echo ""
    read -p "Enter snippet number (1-${#snippets[@]}): " choice
    read -p "Language (sol/gno): " lang
else
    choice=$1
    lang=${2:-"gno"}
fi

# Validate choice
if [ "$choice" -lt 1 ] || [ "$choice" -gt "${#snippets[@]}" ]; then
    echo "Invalid snippet number. Must be between 1 and ${#snippets[@]}"
    exit 1
fi

snippet="${snippets[$((choice-1))]}"
dir="snippets/$snippet"

echo "Testing: $snippet ($lang)"
cd "$dir"

case $lang in
    sol|solidity)
        if command -v solc &> /dev/null; then
            solc --bin *.sol && echo "✓ Solidity OK"
        else
            echo "⚠ solc not installed, skipping"
        fi
        ;;
    gno)
        gnodev . && echo "✓ Gno OK"
        ;;
    *)
        echo "Invalid language. Use 'sol' or 'gno'"
        exit 1
        ;;
esac
