#!/bin/bash
source ../../creds.file
reset=$1
case $reset in
        mr5)
        echo "***Resetting Mini Rack 5. MHO 1 & MHO 2***"
        echo "reset MiniRack5-MHO1"
        ansible-playbook MHO-reset.yml -e "target=MiniRack5-MHO1"
        echo "reset MiniRack5-MHO2"
        ansible-playbook MHO-reset.yml -e "target=MiniRack5-MHO2"
        ;;

        mr13)
        echo "***Resetting Mini Rack 13. MHO 1 & MHO 2***"
        echo "reset MiniRack13-MHO1"
        ansible-playbook MHO-reset.yml -e "target=MiniRack13-MHO1"
        echo "reset MiniRack13-MHO2"
        ansible-playbook MHO-reset.yml -e "target=MiniRack13-MHO2"
        ;;

        mrboth)
        echo "***Resetting Mini Rack 5&13. MHO 1 & MHO 2***"
        echo "reset MiniRack5-MHO1"
        ansible-playbook MHO-reset.yml -e "target=MiniRack5-MHO1"
        echo "reset MiniRack13-MHO1"
        ansible-playbook MHO-reset.yml -e "target=MiniRack13-MHO1"
        echo "reset MiniRack5-MHO2"
        ansible-playbook MHO-reset.yml -e "target=MiniRack5-MHO2"
        echo "reset MiniRack13-MHO2"
        ansible-playbook MHO-reset.yml -e "target=MiniRack13-MHO2"
        ;;

        demolab)
        echo "Resetting DemoLab. MHO 1 & MHO 2"
        echo "reset EMEA-Orch-1"
        ansible-playbook MHO-reset.yml -e "target=EMEA-Orch-1"
        echo "reset EMEA-Orch-2"
        ansible-playbook MHO-reset.yml -e "target=EMEA-Orch-2"
        ;;

        *)
        printf "Usage: `basename $0` < mr5 | mr13 | mrboth | demolab >\n"
        exit 64
        ;;
esac
