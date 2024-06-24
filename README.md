
# Monitoring & Logging Stack

This repository contains a comprehensive DevOps stack for monitoring and logging, utilizing tools such as Elasticsearch, Kibana, Logstash, Prometheus, Grafana, and more. The stack is configured for deployment using both Ansible and Kubernetes, with CI/CD pipelines facilitated through Jenkins.

## Table of Contents

-   [Overview](#overview)
-   [Folder Structure](#folder-structure)
-   [Ansible Setup](#ansible-setup)
-   [Kubernetes Setup](#kubernetes-setup)
-   [CI/CD Pipelines](#cicd-pipelines)
-   [Scripts](#scripts)
-   [Variables](#variables)
-   [Contributing](#contributing)
-   [License](#license)

## Overview

This repository is organized to deploy a complete monitoring and logging solution. It includes configurations and deployment scripts for various components, leveraging Ansible for configuration management and Kubernetes for container orchestration. CI/CD pipelines are set up to automate the deployment processes.

## Folder Structure

```sh

├── ansible
│   ├── install_stack.yml
│   └── roles
│       ├── alertmanager
│       ├── blackbox_exporter
│       ├── elasticsearch
│       ├── elasticsearch-curator
│       ├── filebeat
│       ├── grafana
│       ├── java
│       ├── kibana
│       ├── logstash
│       ├── nginx
│       ├── node_exporter
│       ├── process_exporter
│       └── prometheus
├── kubernetes
│   └── helm_charts
│       ├── common_charts
│       │   ├── nginx
│       │   └── oauth2-proxy
│       ├── logging
│       │   ├── elasticsearch
│       │   ├── kibana
│       │   └── logstash
│       └── monitoring
│           ├── alertmanager
│           ├── grafana
│           ├── node_exporter
│           └── prometheus
├── pipelines
│   └── deploy
│       ├── logging
│       └── monitoring
├── scripts
│   └── tasks
│       ├── check_issue.py
│       └── resolve_issue.py
└── variables
    ├── ansible
    │   └── env
    │       ├── common.yml
    │       ├── hosts
    │       └── nginx.yml
    └── kubernetes
        └── env
            └── common.yml

```
## Ansible Setup

The `ansible` directory contains playbooks and roles for deploying the monitoring and logging stack using Ansible.

-   `ansible.cfg`: Configuration file for Ansible.
-   `ansible-playbook -i variables/ansible/env/hosts ansible/install_stack.yml --tags monitoring-stack,logging-stack`: use tags for deploying each component.
-   `roles/`: Directory containing Ansible roles for each component.

### Running Ansible Playbooks

1.  Ensure you have Ansible installed.
2.  Update the inventory file and variables as needed.
3.  Run the desired playbook using the pipeline


## Kubernetes Setup

The `kubernetes` directory contains Helm charts for deploying the stack on Kubernetes.

-   `helm_charts/`: Directory containing Helm charts for common services, logging components, and monitoring components.

### Deploying with Helm

1.  Ensure you have Helm and kubectl installed.
2.  Update the values in the Helm charts as necessary.
3.  Deploy the Helm charts using the pipeline


## CI/CD Pipelines

The `pipelines` directory contains Jenkinsfiles for automating the deployment of the monitoring and logging stack.

-   `deploy/logging/Jenkinsfile`: Pipeline for deploying logging components.
-   `deploy/monitoring/Jenkinsfile`: Pipeline for deploying monitoring components.

### Running Pipelines

1.  Ensure Jenkins is set up and configured.
2.  Add the Jenkinsfiles to your Jenkins jobs.
3.  Trigger the jobs to deploy the stack.

## Scripts

The `scripts` directory contains utility scripts for various tasks.

-   `tasks/check_issue.py`: Script to check for issues.
-   `tasks/resolve_issue.py`: Script to resolve issues.

### Running Scripts

Create and run the scripts using pipeline

## Variables

The `variables` directory contains configuration files for Ansible and Kubernetes.

-   `ansible/env/`: Directory for Ansible environment variables.
-   `kubernetes/env/`: Directory for Kubernetes environment variables.

Update these files with your environment-specific settings before deploying the stack.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes.

## License

This project is private and not licensed for public use.
