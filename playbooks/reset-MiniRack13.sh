#!/bin/bash
source ../../creds.file
echo "reset MiniRack13-MHO1"
ansible-playbook MHO-reset.yml -e "target=MiniRack13-MHO1"
echo "reset MiniRack13-MHO2"
ansible-playbook MHO-reset.yml -e "target=MiniRack13-MHO2"
