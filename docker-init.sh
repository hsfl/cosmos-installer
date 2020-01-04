#!/bin/bash

set -m

# Start the first process
/root/cosmos/bin/agent_cpu &

# Start the second process
/root/cosmos/bin/propagator_simple &

cd /root/cosmos-web
npm start &

# Start the second process
/root/cosmos/projects/cosmos-mongodb/agent_build/agent_mongo
