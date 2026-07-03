# Azure Web Infrastructure — Full IaC Pipeline

A production-grade, highly available web infrastructure deployed entirely through code.

## Architecture

GitHub Actions Pipeline → Terraform → Azure Load Balancer → VM-1 + VM-2 → Ansible

## What This Demonstrates

- Infrastructure as Code — all Azure resources defined in Terraform HCL
- Modular design — reusable VM and load balancer modules
- CI/CD automation — GitHub Actions deploys on every push to main
- Configuration management — Ansible installs and hardens each server
- High availability — multiple VMs behind an Azure Load Balancer
- Security hardening — UFW firewall, SSH hardening, key-only auth
- Remote state — Terraform state stored in Azure Blob Storage

## Tech Stack

| Tool | Purpose |
|------|---------|
| Terraform | Provision Azure infrastructure |
| Ansible | Configure and harden servers |
| GitHub Actions | CI/CD pipeline automation |
| Azure Load Balancer | Distribute traffic across VMs |
| Azure Blob Storage | Remote Terraform state backend |

## Built By

AJ (Amit Kumar) — System Administrator pursuing Cloud/Virtualization Architect roles.
Certifications: VCP-DCV, AZ-104, M365 Administrator Expert, SC-200
