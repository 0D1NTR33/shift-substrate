# shift-substrate
ShiftNRG's Substrate blockchain source code

## Setup Steps
These steps are currently working for Ubuntu 18.04. Other OS Support coming later.

1. run `./install.sh` # this will take up to 15-30 minutes pending your system's specs
2. `nano ./config.sh` # Update `NODE_NAME` (Line 6) to your liking 
3. run `./config.sh` # this setups the configuration and runs the node as a service on your Ubuntu system
   1. This script will ask if you're wanting to be a `validator` or `full node`. Answer occurdingly. 
   2. This script enables and starts your validator/node! Check the sections belows
4. **Validator Step Only!** Update the `aura.json` & `gran.json` files with your `mnemonic phrase` key and `public key`
   1. Run `./insert-keys.sh`. Note: node must be running!

# Notes
* allow port `30333` through your firewall. This is the default p2p port for node comms
  * `sudo ufw allow 30333 && sudo ufw reload`

# Validators
* Status check: `sudo systemctl status shift-substrate-validator.service`
* Restarting your service: `sudo systemctl restart shift-substrate-validator.service`
* Tail logs: `tail -f /var/log/syslog`

# Full Nodes
* Status check: `sudo systemctl status shift-substrate-node.service`
* Restarting your service: `sudo systemctl restart shift-substrate-node.service`
* Tail logs: `tail -f /var/log/syslog`