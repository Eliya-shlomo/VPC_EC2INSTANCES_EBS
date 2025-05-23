# MY_SERVICE_MODULE

A fully modular and professional Infrastructure-as-Code (IaC) project using **Terraform** to provision a complete cloud environment in **AWS**.

##  Project Overview 🌐

This project sets up a complete and scalable infrastructure in AWS using Terraform. It includes:

- **Custom VPC** with public and private subnets
- **Internet Gateway** and **NAT Gateway**
- **Elastic Load Balancer (ELB)**
- **EC2 Instances** with key pair authentication
- **Auto Scaling Groups**
- **EBS Volume attached to instances**
- **RDS (MariaDB)**
- **CloudWatch** alarms for autoscaling
- **IAM Roles and S3 Bucket** (optional)

Everything is structured into reusable **Terraform modules** and environment-specific configurations.

---

## 📊 Folder Structure

```bash
MY_SERVICE_MODULE/
├── modules/                  # All reusable infrastructure modules
│   ├── vpc/
│   ├── security_groups/
│   ├── elb/
│   ├── autoscaling/
│   ├── instances/
│   ├── cloudwatch/
│   ├── rds/
│   ├── volumes/
│   └── routable/
│
├── environments/            # Separate folders per environment
│   └── development/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
├── shared/                  # Shared providers and backend (if needed)
│   └── provider.tf
│
└── README.md                # This file
```

---

## ⚖️ Tech Stack

- **Terraform v1.5+**
- **AWS** as cloud provider
- **Terraform AWS Provider**

---

## 💡 Features

- **Modular Design**
- Multi-Environment Support (e.g., `development`, `production`)
- Easy to scale using Auto Scaling
- Monitored infrastructure using CloudWatch alarms
- Uses `terraform.tfvars` for injecting sensitive or environment-specific values
- Optional S3 bucket and IAM role support via toggle (`create_bucket`)

---

## 🔄 How to Use

### 1. Clone the Repository
```bash
git clone https://github.com/Eliya-shlomo/MY_SERVICE_MODULE.git
cd MY_SERVICE_MODULE/environments/development
```

### 2. Configure your credentials
Use AWS CLI or environment variables:
```bash
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
```

Or update `terraform.tfvars` (add to `.gitignore`!):
```hcl
aws_access_key = "..."
aws_secret_key = "..."
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Plan your changes
```bash
terraform plan
```

### 5. Apply
```bash
terraform apply
```

---

## 🔢 Sample `terraform.tfvars`
```hcl
aws_access_key = "..."
aws_secret_key = "..."

aws_region      = "us-east-1"
environment     = "development"

vpc_cidr        = "10.0.0.0/16"
public_subnet_1 = "10.0.1.0/24"
public_subnet_2 = "10.0.2.0/24"
private_subnet_1 = "10.0.3.0/24"
private_subnet_2 = "10.0.4.0/24"

bucket_name     = "my-bucket-vpc-demo-eliyadev"
create_bucket   = false

path_to_public_key = ".vpc_demo_keys/my_key.pub"
instance_type      = "t2.micro"

AMIS = {
  us-east-1 = "ami-0b0ea68c435eb488d"
  us-east-2 = "ami-05803413c51f242b7"
  us-west-1 = "ami-0454207e5367abf01"
  us-west-2 = "ami-0688ba7eeeeefe3cd"
}
```

---

## ❌ Common Issues & Fixes

### ❌ `BucketAlreadyExists`
Bucket names must be globally unique. Use a unique name or set `create_bucket = false`.

### ⚡ `InvalidVolume.ZoneMismatch`
Make sure the instance and EBS volume are in the **same availability zone**.

### ❌ `Invalid function argument` (file not found)
Ensure the `path_to_public_key` exists relative to your working directory.

---

## 📉 Lessons Learned / Problems Solved

- Learned how to structure Terraform using **modules** and **environments**
- Handled issues like:
  - Circular dependency in modules
  - EBS volume AZ mismatch
  - IAM role access using count
  - ELB subnet referencing errors
- Used `outputs.tf` to bridge communication between modules and environments
- Improved S3 bucket logic with toggle

---

## 📊 Future Improvements

- Add `backend.tf` for remote state storage in S3
- Add `production/` environment
- Add GitHub Actions CI/CD for plan/apply
- Visualize architecture with diagrams

---

## 👤 Author
**Eliya Shlomo**  
GitHub: [@github.com/Eliya-shlomo](https://github.com/Eliya-shlomo)

---

## 👾 License
MIT License

