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

3) To see if the tx has a valid spell, you can run

```bash
charms tx show-spell --tx $(cat ./tmp/tx.draft.json | jq -r '.cborHex') --chain=cardano --mock
```

It should print something like

```yaml
version: 6
apps:
  $0000: n/ff5737e38a9643b1876beade2b7eb58720d9b32791ba2d6173dba91d83a0ce76/a1cfba133d276560a88e8b9f7352e4676cadf10b563435ff0eff12174b5be17a
ins: []
outs:
- charms:
    $0000:
      ticker: PRINTER

```
