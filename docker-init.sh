#!/bin/bash

# Start the first process
/root/cosmos/bin/agent_cpu -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the second process
/root/cosmos/bin/propagator_simple -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

cd /root/cosmos-web
npm start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

# Start the second process
/root/cosmos/projects/cosmos-mongodb/agent_build/agent_mongo -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi