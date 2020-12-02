# London Lab automation

Note: This repository is currently a work in progress

## Overview
Integration through Application Programming Interfaces (APIs) in Check Point, orchestration and automation, configuration management and infrastructure as code software tools, all provide a framework for codifying processes into an automated workflow. This eliminates the human risk factor, freeing SOC and IT security teams to concentrate on more critical task

## What does it do?
The repository contains Ansible playbooks in order to configure the Check Point Maestro London lab

## Requirements
- [Check Point Security Management](https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&solutionid=sk166715) - Version R81 later
- Check Point Masetro
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - Version 2.9 or later
- [Ansible check_point.mgmt collection](https://galaxy.ansible.com/check_point/mgmt) - Included by default from version Ansible 2.9
  - **Note:** It is recommended to download the latest version from galaxy
