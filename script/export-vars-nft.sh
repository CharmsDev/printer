#!/bin/bash

wallet_dir=${wallet_dir?Set wallet_dir to your Cardano wallet dir (must have payment.addr)}

export app_vk=$(charms app vk)
export in_utxo_0="3ba4c00dc0041226f456ac694a4317f9e013a8b47a3d6ec326c5b1dd110ef20c:0"
export app_id=$(echo -n "${in_utxo_0}" | sha256sum | cut -d' ' -f1)

export addr_0=$(cat ${wallet_dir}/payment.addr)

# prev_txs=$(b getrawtransaction ${in_utxo_0%%:*})
prev_txs=""
app_bins=$(charms app build)

funding_utxo=23c716ffb23bc380e741cd132cbfcc19d83587ba029e6d59c6c067dd0a24959c:0
# funding_utxo_value=$(b gettxout ${funding_utxo%%:*} ${funding_utxo##*:} | jq '(.value * 100000000) | floor')
funding_utxo_value=20000000
change_address=${addr_0}
