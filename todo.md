I think, this is what I want to do (. If you can get me the basics in place, I can work it through once we get started, and then extend it to the other member (so I need ability to have variables, depending on what I am working on).

- To reset the enviroment . Need to do it in serial since the are gooing to boot up with same ip 192.168.1.1
ssh to MHO 1 & 2 of Minirack 5 and 13
set fcd revert Gaia_R80.20SP


- ANSIBLE: SSH to  xx@172.23.9.90 
  - done PI: echo "" > /home/pi/.ssh/known_hosts
  - done PI: ssh admin@192.168.1.1
  - done PI: <user>
  - done PI: <password>
    - done MHO: lock database override
    - done MHO: set management interface Mgmt1
    - done MHO: set static-route default nexthop gateway address 192.168.1.254 off
    - done MHO: set static-route default nexthop gateway address 172.23.9.1 priority 6 on
    - done MHO: set static-route default nexthop gateway address 172.23.9.254 priority 3 on
    - done MHO: set dns primary 1.1.1.1
    - done MHO: set format date dd-mmm-yyyy
    - done MHO: set format time 24-hour
    - done MHO: set format netmask Dotted
    - done MHO: set hostname MiniRack5-MHO1
    - done MHO: set ntp active on
    - done MHO: set ntp server primary pool.ntp.org version 4
    - done MHO: set timezone Europe / London
    - done MHO: set interface Mgmt1 state on
    - done MHO: set interface Mgmt1 auto-negotiation on

- done ANSIBLE: PI: *** Start ping to 172.23.9.31
  - done MHO: set interface Mgmt1 ipv4-address 172.23.9.31 mask-length 2
- done ANSIBLE: PI: ***connection will be lost
- done ANSIBLE: PI: *** Confirm ping is possible to IP above. 
  - done PI: ssh admin@172.23.9.31
  - done PI: <user>
  - done PI: <password>
    - done MHO: set expert-password (set to vpn123)
    - done MHO: expert
    - done MHO: mkdir –p /var/log/hfa 
    - done MHO: cd /var/log/hfa/
    - done MHO: ftp 172.23.9.90 
    - done MHO: <user> 
    - done MHO: <password>
    - done MHO: bin
    - done MHO: get <filename>
    - done MHO: bye
    - done MHO: installer import local /var/log/hfa/<filename>
- done ANSIBLE:  MHO: **test for ID of filename above) 
  - done MHO: installer install <id>
- ANSIBLE:  MHO: **device will reboot. Wait approx. 5 mins, and check you could ping, then could not (as it reboots), then pings again
- ANSIBLE:  ssh admin@172.23.9.31
- ANSIBLE:  <user>
- ANSIBLE:  <password>
  - MHO: expert 
  - MHO: <password>
  - MHO: touch /etc/.asg_auto_confirm
  - MHO: exit
  - MHO: set maestro configuration orchestrator-amount 1
  - MHO: set maestro port 1/1/1 qsfp-mode 1G
  - MHO: set maestro port 1/5/1 qsfp-mode 1G
  - MHO: set maestro port 1/6/1 qsfp-mode 1G
  - MHO: set maestro  port 1/47/1 type site_sync
  - MHO: set maestro  port 1/47/1 admin-state down (run it on Minirack5-MHO1&2 but not on Minirack13-MHO1&2)
  - MHO: expert <password>
  - MHO: rm /etc/.asg_auto_confirm
  - MHO: exit

Now repeat for different IP address/name/settings etc.


- Four Miniracks

  - Minirack5
    - MiniRack5-MHO1 ( IP )
    - MiniRack5-MHO2 ( IP )
  - Minirack13
      - MiniRack13-MHO1 ( IP )
      - MiniRack13-MHO2 ( IP )
  - EMEA-MHO1 (DemoLab)
     - EMEA-Orch-1 ( IP )
     - EMEA-Orch-2 (IP )
