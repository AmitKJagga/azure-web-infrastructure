# Azure Web Infrastructure — Full IaC Pipeline

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat&logo=ansible&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=github-actions&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?style=flat&logo=microsoft-azure&logoColor=white)

A production-grade, highly available web infrastructure deployed entirely through code — zero manual steps from commit to running servers.

## Architecture

Developer pushes code to GitHub → GitHub Actions Pipeline → Terraform → Azure Load Balancer → 2x Ubuntu VMs → Ansible configures each VM

## What This Project Demonstrates

| Skill | Implementation |
|-------|---------------|
| Infrastructure as Code | All Azure resources defined in Terraform HCL |
| Modular IaC design | Reusable VM and Load Balancer Terraform modules |
| CI/CD automation | GitHub Actions deploys on every push to main |
| Configuration management | Ansible configures and hardens both servers |
| High availability | 2x Ubuntu VMs behind Azure Standard Load Balancer |
| Security hardening | UFW firewall, SSH root disabled, key-only auth |
| Remote state management | Terraform state in Azure Blob Storage with locking |

## Tech Stack

| Tool | Purpose |
|------|---------|
| Terraform 1.5 | Provision Azure infrastructure |
| Ansible | Configure and harden servers |
| GitHub Actions | CI/CD pipeline automation |
| Azure Load Balancer Standard | Distribute traffic across VMs |
| Azure Blob Storage | Remote Terraform state backend |
| Ubuntu Server 22.04 LTS Gen2 | VM operating system |

## Project Structure

- main.tf — Root config, provider, backend, module calls
- variables.tf — Input variables with defaults
- modules/vm/ — Reusable VM module supporting count
- modules/loadbalancer/ — Azure Load Balancer module
- ansible/playbook.yml — 13-task server configuration playbook
- ansible/inventory.tpl — Dynamic inventory template
- .github/workflows/deploy.yml — Full CI/CD pipeline

## How to Deploy

1. Fork this repository
2. Add GitHub Secrets: AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID, AZURE_SUBSCRIPTION_ID, SSH_PUBLIC_KEY, SSH_PRIVATE_KEY
3. Push any change to main branch
4. Watch the Actions tab — infrastructure deploys automatically
5. Visit the load balancer IP in your browser

## What Ansible Configures on Each VM

- Updates apt package cache
- Installs nginx web server
- Installs and configures UFW firewall
- Opens only ports 22 (SSH) and 80 (HTTP)
- Disables root SSH login
- Enforces SSH key-only authentication
- Deploys custom web page showing server hostname and IP

## Security

- No passwords — SSH key authentication only
- Root login disabled on all VMs
- UFW firewall default deny policy
- Terraform state encrypted at rest in Azure Blob Storage
- All secrets stored in GitHub Secrets — never in code

## Built By

**AJ (Amit Kumar)** — System Administrator at Fastenal, Canada

Pursuing Cloud and Infrastructure Engineer roles in Toronto and Remote

Certifications: VCP-DCV | AZ-104 | M365 Administrator Expert | SC-200

July 2026

[GitHub Profile](https://github.com/AmitKJagga)
