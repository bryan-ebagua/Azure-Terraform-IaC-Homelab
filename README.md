# Azure Infrastructure as Code (IaC) with Terraform

## Overview
This repository contains Terraform code to deploy modular Azure infrastructure. It uses separate child modules for networking and compute to provision an Ubuntu Linux virtual machine within a custom virtual network.

## Architecture & Resources
The code deploys the following Azure resources:
* **Resource Group:** Central container for the deployment.
* **Virtual Network (VNet):** Custom `/16` address space.
* **Subnets:** Segmented into `/24` public and private tiers.
* **Network Security Group (NSG):** Firewall rules for inbound and outbound traffic control.
* **Network Interface (NIC):** Dynamic private IP allocation attached to the public subnet.
* **Virtual Machine:** Ubuntu 22.04 LTS server.

##  How to Deploy

### Prerequisites
1. Install [Terraform](https://developer.hashicorp.com/terraform/downloads).
2. Install the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
3. Authenticate with Azure:
 ```bash
 az login
```
### Deployment Steps
Initialize the directory and download the required providers:

```Bash
terraform init
```
Review the execution plan:

```Bash
terraform plan
```
Apply the configuration:

```Bash
terraform apply
```
Destroy resources when finished to prevent ongoing cloud charges:

```Bash
terraform destroy
```
## Key Learnings & Challenges
Modular Architecture: Passed data between child modules by mapping outputs (e.g., subnet_id from the network module) as direct inputs to the compute module.

State Management: Verified Terraform's state handling during failed compute deployments. Successfully provisioned network resources were preserved in the state file and not duplicated on subsequent runs.

Resource Constraints: Addressed Azure Free Tier capacity limitations (403 Policy Forbidden and 409 SkuNotAvailable) by using Azure CLI queries (az vm list-skus) to identify regions and data centers with available hardware capacity.
