#!/bin/bash

# Owner wallet Creation
btcli w regen_coldkey --no_password --no_prompt --wallet.name owner --mnemonic advice swear inherit physical quit toast category wolf pulp basket hamster increase

# Miner wallet Creation
btcli w regen_coldkey --no_password --no_prompt --wallet.name miner --mnemonic poem turtle drill wet forget trigger mango palace gap symptom seek web

# rare body dynamic pulse plastic february coral mother example tide tiger child
btcli wallet new_hotkey --no_password --no_prompt --wallet.name miner --wallet.hotkey default

# Validator wallet Creation
# climb couple soap egg negative primary tissue hunt rough modify echo lake
btcli wallet new_coldkey --no_password --no_prompt --wallet.name validator
# rail electric section novel junk height custom glove right penalty lobster clerk
btcli wallet new_hotkey --no_password --no_prompt --wallet.name validator --wallet.hotkey default


btcli wallet faucet --no_promp --wallet.name owner --subtensor.chain_endpoint ws://172.28.1.10:9946
# btcli wallet faucet --wallet.name owner --subtensor.chain_endpoint ws://172.28.1.10:9945
172.28.1.10


btcli regen_hotkey




btcli wallet new_coldkey --no_password --no_prompt --wallet.name owner
btcli wallet new_coldkey --no_password --no_prompt --wallet.name miner
btcli wallet new_hotkey --no_password --no_prompt --wallet.name miner --wallet.hotkey default

btcli wallet new_coldkey --no_password --no_prompt --wallet.name validator
btcli wallet new_hotkey --no_password --no_prompt --wallet.name validator --wallet.hotkey default