#!/usr/bin/env sh
# Source: https://github.com/gnolang/gno/pull/4346

# Shorthand constants
ALICE_MNEMONIC="hollow tortoise fatigue front phone prepare usual because traffic rapid disease more indoor open guide cushion ladder breeze barrel ticket program margin gold unveil"
BOB_MNEMONIC="unusual cousin auction delay tooth stand connect resist shed fat struggle sheriff much impact soft skull life luxury artefact apple cool siege film hurdle"
CHARLIE_MNEMONIC="pulse soda vocal office awful day hen head tattoo barely glare seed east course chase improve lady fatigue employ bike cliff mind profit relief"

ALICE_PUBKEY="gpub1pgfj7ard9eg82cjtv4u4xetrwqer2dntxyfzxz3pqvxrj6thyj2m4tx8jkkkta9sw0l2gq9s7p942fu8x62gf94ajaeqzkv4vxn"
BOB_PUBKEY="gpub1pgfj7ard9eg82cjtv4u4xetrwqer2dntxyfzxz3pqftr6h6ezwalst6w9jhz3a364ea9w7ng6llzn99h39h86r8n4l50vhd4le6"
CHARLIE_PUBKEY="gpub1pgfj7ard9eg82cjtv4u4xetrwqer2dntxyfzxz3pq0jssmteqt89cmns7ruyvkv28uyaq2skdtcxz9pzkgjpruv6hng4xxcvy2q"

MULTISIG_ADDRESS="g1p9ff8mut5r3qpuut0p8vrud98ufd2yrwvd7m5l"
ALICE_ADDRESS="g1hsj5ay9ffyug7nd5vfj9akdw2khjw775qzszc2"
BOB_ADDRESS="g1xec4unxwd2w3509nld7qq4tsznw0jxwnvyw5hj"
CHARLIE_ADDRESS="g13jnjvt8l7ahqyw222acy2h82xgfyss0gk7qzmz"

ALICE_KB="./alice-kb"
BOB_KB="./bob-kb"
CHARLIE_KB="./charlie-kb"

ALICE_SIG="./alice-sig.json"
BOB_SIG="./bob-sig.json"
CHARLIE_SIG="./charlie-sig.json"

TX_PAYLOAD="./multisig-abc-send.json"

account_number() {
    addr="$1"

    gnokey query auth/accounts/"$addr" \
      | sed -n '2,$p' \
      | sed '1s/^data:[[:space:]]*//' \
      | jq -r '.BaseAccount.account_number'
}

account_sequence() {
      addr="$1"

    gnokey query auth/accounts/"$addr" \
      | sed -n '2,$p' \
      | sed '1s/^data:[[:space:]]*//' \
      | jq -r '.BaseAccount.sequence'
}

# Cleanup
rm -rf $TX_PAYLOAD

# Create Alice's gnokey dir
rm -rf $ALICE_KB && mkdir $ALICE_KB

# Create Bob's gnokey dir
rm -rf $BOB_KB && mkdir $BOB_KB

# Create Charlie's gnokey dir
rm -rf $CHARLIE_KB && mkdir $CHARLIE_KB

# Remove leftover signature files
rm -rf ./*-sig.json $TX_PAYLOAD

# Initialize Alice's keybase
echo "\n\n$ALICE_MNEMONIC" | gnokey add --recover "alice" --home "$ALICE_KB" -insecure-password-stdin -quiet
gnokey add bech32 --home "$ALICE_KB" -pubkey $BOB_PUBKEY multisig-bob
gnokey add bech32 --home "$ALICE_KB" -pubkey $CHARLIE_PUBKEY multisig-charlie
#gnokey add multisig --home "$ALICE_KB" --multisig alice --multisig multisig-bob --multisig multisig-charlie -threshold 2 multisig-abc
gnokey add multisig --home "$ALICE_KB" --multisig alice --multisig multisig-bob --multisig multisig-charlie -threshold 2 multisig-abc

# Initialize Bob's keybase
echo "\n\n$BOB_MNEMONIC" | gnokey add --recover "bob" --home "$BOB_KB" -insecure-password-stdin -quiet
gnokey add bech32 --home "$BOB_KB" -pubkey $ALICE_PUBKEY multisig-alice
gnokey add bech32 --home "$BOB_KB" -pubkey $CHARLIE_PUBKEY multisig-charlie
gnokey add multisig --home "$BOB_KB" --multisig multisig-alice --multisig bob --multisig multisig-charlie -threshold 2 multisig-abc

# Initialize Charlie's keybase
echo "\n\n$CHARLIE_MNEMONIC" | gnokey add --recover "charlie" --home "$CHARLIE_KB" -insecure-password-stdin -quiet
gnokey add bech32 --home "$CHARLIE_KB" -pubkey $ALICE_PUBKEY multisig-alice
gnokey add bech32 --home "$CHARLIE_KB" -pubkey $BOB_PUBKEY multisig-bob
gnokey add multisig --home "$CHARLIE_KB" --multisig multisig-alice --multisig multisig-bob --multisig charlie -threshold 2 multisig-abc

# Create a common transaction that should be signed
gnokey maketx send --home "$ALICE_KB" -chainid dev -send "100000ugnot" -gas-fee 100000ugnot -gas-wanted 100000 -to g1pm60rkcvkt4j6s24vgygyfuu3c2f5gt76lqtss multisig-abc > $TX_PAYLOAD

# Alice generates the transaction signature. Note that each multisig participant uses the account information of the multisig address.
MULTISIG_ACC_NUM=$(account_number "$MULTISIG_ADDRESS")
MULTISIG_ACC_SEQ=$(account_sequence "$MULTISIG_ADDRESS")
echo "\n\n" | gnokey sign --tx-path $TX_PAYLOAD --home "$ALICE_KB" alice --account-number $MULTISIG_ACC_NUM --account-sequence $MULTISIG_ACC_SEQ -insecure-password-stdin -quiet --output-document $ALICE_SIG

# Bob generates the transaction signature
echo "\n\n" | gnokey sign --tx-path $TX_PAYLOAD --home "$BOB_KB" bob --account-number $MULTISIG_ACC_NUM --account-sequence $MULTISIG_ACC_SEQ -insecure-password-stdin -quiet --output-document $BOB_SIG

# Sign the transaction with the multisig
gnokey multisign --tx-path $TX_PAYLOAD --home "$ALICE_KB" --signature $ALICE_SIG --signature $BOB_SIG multisig-abc

# Broadcast the transaction
gnokey broadcast $TX_PAYLOAD --home "$ALICE_KB"