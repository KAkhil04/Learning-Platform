#!/bin/bash

# Get the list of all nodes
nodes=$(oc get nodes -o jsonpath='{.items[*].metadata.name}')

# Define the parameters to check
parameters=("vm.panic_on_oom" "kernel.keys.root_maxbytes" "kernel.keys.root_maxkeys" "kernel.panic" "kernel.panic_on_oops" "vm.overcommit_memory" "kernel.panic")

# Loop through each node
for node in $nodes; do
  echo "Node: $node"
  
  # Start a debug session on the node
  oc debug node/$node -- chroot /host bash -c '
    # Check if sysctl configuration file exists
    if sudo [ -f /etc/sysctl.d/90-kubelet.conf ]; then
      echo "File exists"
    else
      echo "Not Exists"
    fi

    # Loop through each parameter and check its value
    for parameter in '"${parameters[@]}"'; do
      echo "Parameter:" $parameter
      sudo grep $parameter /etc/sysctl.d/90-kubelet.conf || echo "Not found"
    done
  '
done
