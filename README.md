# printer

Print like the Fed.

Here are a few commands to get started:

0) build charms from source https://github.com/CharmsDev/charms:
```bash
cargo install --profile=test --path . --locked --bin charms
```

1) In the `printer` repo root dir, run:
```bash
. ./script/export-vars-nft.sh
```

If it prints an error about wallet_dir, set `wallet_dir` and run again.

2) Now you're ready to prove a spell:

```bash
cat ./spells/mint-nft.yaml | envsubst | charms spell prove --app-bins=$app_bins --prev-txs=$prev_txs --funding-utxo=$funding_utxo --funding-utxo-value=$funding_utxo_value --change-address=$change_address --chain=cardano --mock > ./tmp/tx.draft.json
```

This will create ./tmp/tx.draft.json which can be signed and submitted to the Cardano network.
