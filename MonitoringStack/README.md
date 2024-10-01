# Monitoring & Logging Stack

This repository contains a comprehensive DevOps stack for monitoring, utilizing tools such as Prometheus, Grafana, Blackbox Exporter, Alertmanager, and Process Exporter. The stack is configured for deployment using Ansible.

## Table of Contents

- [Overview](#overview)
- [Folder Structure](#folder-structure)
- [Versions](#versions)
- [Ansible Setup](#ansible-setup)
- [Running Ansible Playbooks](#running-ansible-playbooks)
- [Variables](#variables).

## Overview

This repository is organized to deploy a complete monitoring solution. It includes configurations and deployment scripts for various components, leveraging Ansible for configuration management.

## Folder Structure

```sh
├── ansible
│   └── roles
│       ├── alertmanager
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   ├── alternative
│       │   │   │   └── tests
│       │   │   ├── default
│       │   │   │   └── tests
│       │   │   └── latest
│       │   │       └── tests
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       ├── blackbox_exporter
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   ├── alternative
│       │   │   │   └── tests
│       │   │   ├── default
│       │   │   │   └── tests
│       │   │   └── latest
│       │   │       └── tests
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       ├── grafana
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   ├── alternative
│       │   │   │   └── tests
│       │   │   └── default
│       │   │       └── tests
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       │       └── distro
│       ├── nginx
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   └── default
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       ├── node_exporter
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   ├── alternative
│       │   │   │   └── tests
│       │   │   ├── default
│       │   │   │   └── tests
│       │   │   └── latest
│       │   │       └── tests
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       ├── process_exporter
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   ├── alternative
│       │   │   │   └── tests
│       │   │   ├── default
│       │   │   │   └── tests
│       │   │   └── latest
│       │   │       └── tests
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       ├── prometheus
│       │   ├── defaults
│       │   ├── handlers
│       │   ├── meta
│       │   ├── molecule
│       │   │   ├── agentmode
│       │   │   │   └── tests
│       │   │   ├── alternative
│       │   │   │   └── tests
│       │   │   ├── default
│       │   │   │   └── tests
│       │   │   └── latest
│       │   │       └── tests
│       │   ├── tasks
│       │   ├── templates
│       │   └── vars
│       └── users
│           ├── defaults
│           └── tasks
└── variables
    └── ansible
        ├── env
        │   ├── common.yml
        │   ├── custom-alertrules
        │   │   ├── blackbox_exporter_alerts.rules
        │   │   └── node_exporter_alerts.rules
        │   ├── custom-dashboards
        │   │   ├── alert123.json
        │   │   ├── custom3.json
        │   │   └── process.json
        │   └── nginx.yml
        └── hosts

```
## Versions

-  Grafana -   `11.2.0`
-  Prometheus -   `2.51.2`
-  Node-exporter -   `1.7.0`
-  Alertmanager -   `0.27.0`
-  Blackbox-exporter -   `0.25.0`
-  Process-exporter -   `0.8.1`
     -   "Kindly prefer the latest versions if the above versions are not worked"

## Ansible Setup

The `ansible` directory contains playbooks and roles for deploying the monitoring stack using Ansible.

-   `ansible.cfg`: Configuration file for Ansible.
-   `roles/`: Directory containing Ansible roles for each component.
-   `custom-alertrules`: Folder containing a list of alerting rules; you can add multiple alert rules if required.
-   `custom-dashboards`: Folder containing a list of dashboards; you can add more dashboards here if needed.

## Running Ansible Playbooks

-  Ensure you have Ansible installed.
-  Make sure all servers are connected to the Ansible server (via SSH).
-  Clone the repository from GitHub to the Ansible server.
-  Update the inventory file `../variables/ansible/hosts`
    -   `target-nodes`- Ensure to add all the target Ip's and add `monitoring-stack` Ip to check the health of the instance.
    -   `monitoring-stack`- Add the monitoring server Ip which you need to install monitoring stack.
    -   `webserver`- Add the webserver Ip to install the webservers.
    -   `blackbox-ip`- Add the blackbox Ip here to install `blackbox` in the server and to connect to the prometheus.
-  Update the `common.yml` file `../variables/ansible/env/common.yml`
    -    `#Grafana Configuration` congifure the login setup (username and user password).
    -    `#Import Grafana Public Dashboards` Add, remove or replace the public dashboards by using the `dashboard_id` and `revision_id`if required.
    -    `#Alert Manager Config` update the `email configs` 
-  Update the custom-dashboards and custom-alertrules`../variables/ansible/env/custom-dashboards custom-alertrules` if required.
-  Run the Ansible playbook :  `ansible-playbook -i variables/ansible/hosts ansible/deploy-stack-vm.yml`
-  Ensure the correct path and directories before running the playbook.

## Variables

The `variables` directory contains configuration files for Ansible.

-   `...variables/ansible/env`: Directory which contains Ansible environment variables like `common.yml` `custom-dashboards` ` custom alertrules`.

Update these files with your environment-specific settings before deploying the stack
