# TechCorp Terraform Infrastructure

This project provisions a small AWS environment with:
- A custom VPC with 2 public and 2 private subnets
- A bastion host in a public subnet
- Two private web servers behind an Application Load Balancer (ALB)
- One private database server
- Internet and NAT gateways, route tables, and security groups

## Prerequisites

Before deployment, ensure you have:
- An AWS account with permissions for VPC, EC2, Load Balancer, EIP, and related networking resources
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed (v1.0+ recommended)
- AWS credentials configured locally (for example with `aws configure` or environment variables)
- An existing EC2 key pair in your target region (used for bastion SSH access)

You should also know your current public IP address for secure SSH access (CIDR format, for example `203.0.113.10/32`).

## Deployment Instructions

1. **Clone and enter the project directory**
   ```bash
   git clone <your-repo-url>
   cd AssigmentOne
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Create your variable file**

   Copy the example file and update values:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

   Update at least:
   - `region` (for example `us-east-1`)
   - `key_name` (must match an existing EC2 key pair in that region)
   - `my_ip` (your public IP in CIDR format, e.g. `x.x.x.x/32`)
   - CIDR blocks and instance types if you want non-default sizing/network ranges

4. **Review the execution plan**
   ```bash
   terraform plan
   ```

5. **Apply the infrastructure**
   ```bash
   terraform apply
   ```
   Type `yes` when prompted.

6. **Confirm outputs**

   After apply, Terraform returns:
   - `alb_dns` (public URL for the web tier)
   - `bastion_public_ip` (for SSH jump-host access)
   - `vpc_id`

   You can re-check outputs anytime:
   ```bash
   terraform output
   ```

## Cleanup / Destroy Instructions

To remove all provisioned resources and avoid ongoing AWS charges:

1. Ensure you are in the same project directory with the same state file used for deployment.
2. Run:
   ```bash
   terraform destroy
   ```
3. Type `yes` when prompted.

For non-interactive teardown:
```bash
terraform destroy -auto-approve
```