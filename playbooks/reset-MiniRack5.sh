#!/bin/bash
source ../../creds.file
echo "reset MiniRack5-MHO1"
ansible-playbook MHO-reset.yml -e "target=MiniRack5-MHO1"
echo "reset MiniRack5-MHO2"
ansible-playbook MHO-reset.yml -e "target=MiniRack5-MHO2"
