I think, this is what I want to do (. If you can get me the basics in place, I can work it through once we get started, and then extend it to the other member (so I need ability to have variables, depending on what I am working on).

- ANSIBLE: SSH to  xx@172.23.9.90 
  - PI: echo "" > /home/pi/.ssh/known_hosts
  - PI: ssh admin@192.168.1.1
  - PI: <user>
  - PI: <password>
    - MHO: lock database override
    - MHO: set management interface Mgmt1
    - MHO: set static-route default nexthop gateway address 192.168.1.254 off
    - MHO: set static-route default nexthop gateway address 172.23.9.1 priority 6 on
    - MHO: set static-route default nexthop gateway address 172.23.9.254 priority 3 on
    - MHO: set dns primary 1.1.1.1
    - MHO: set format date dd-mmm-yyyy
    - MHO: set format time 24-hour
    - MHO: set format netmask Dotted
    - MHO: set hostname MiniRack5-MHO1
    - MHO: set ntp active on
    - MHO: set ntp server primary pool.ntp.org version 4
    - MHO: set timezone Europe / London
    - MHO: set interface Mgmt1 state on
    - MHO: set interface Mgmt1 auto-negotiation on

- ANSIBLE: PI: *** Start ping to 172.23.9.31
  - MHO: set interface Mgmt1 ipv4-address 172.23.9.31 mask-length 2
- ANSIBLE: PI: ***connection will be lost
- ANSIBLE: PI: *** Confirm ping is possible to IP above. 
  - PI: ssh admin@172.23.9.31
  - PI: <user>
  - PI: <password>
    - MHO: set expert-password (set to vpn123)
    - MHO: expert
    - MHO: mkdir –p /var/log/hfa 
    - MHO: cd /var/log/hfa/
    - MHO: ftp 172.23.9.90 
    - MHO: <user> 
    - MHO: <password>
    - MHO: bin
    - MHO: get <filename>
    - MHO: bye
    - MHO: installer import local /var/log/hfa/<filename>
- ANSIBLE:  MHO: **test for ID of filename above) 
  - MHO: installer install <id>
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
  - MHO: set maestro  port 1/47/1 admin-state down
  - MHO: expert <password>
  - MHO: rm /etc/.asg_auto_confirm
  - MHO: exit

Now repeat for different IP address/name/settings etc.