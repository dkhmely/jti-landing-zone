# jti-landing-zone

## Purpose
The `jti-landing-zone` repository contains Infrastructure as Code (IaC) scripts using **Terraform** to automate the deployment of a foundational **Azure Landing Zone** for JTI environments. It enables consistent provisioning and management of cloud infrastructure across `dev`, `qa`, `stage`, and `main` environments.

---

## What It Provisions
This repository provisions the following core Azure resources:

- Resource Group
- Virtual Network
- Azure Key Vault
- Storage Account
- Role Assignments
- Service Principal

---

## CI/CD Pipeline
The automation is powered by GitHub Actions (`pipeline.yaml`) and supports the following Terraform actions:

### Actions Supported:
- `plan`
- `apply`
- `destroy`

### Triggers:
- Automatically on pushes to the following branches (Only plan):
  - `dev`
  - `qa`
  - `stage`
  - `main`
- Manually via GitHub's **workflow_dispatch** with selectable action (`plan`, `apply`, or `destroy`).

---

## Remote State Configuration
Terraform remote state is configured via a template file `backend-template.conf`, which dynamically sets the backend parameters:

```hcl
resource_group_name  = "terraform-state"
storage_account_name = "jtitfstate"
container_name       = "tfstate"
key                  = "lz${ENV}.terraform.tfstate"
```

This ensures each environment maintains a separate and secure state file in Azure Storage.

---
