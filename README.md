# Terraform AWS 3Tier App with Bastion Host (check the development branch for right code)

This repository contains Terraform code to provision the resources needed to deploy a three-tier application on AWS. The architecture includes a bastion host, web server, application server, and an RDS database. You can find the code and resources at the following GitHub repository: [https://github.com/sundesz/vpc-ec2-rds](https://github.com/sundesz/vpc-ec2-rds).

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- An AWS account with appropriate permissions to create resources.
- Terraform installed on your local machine. You can download Terraform from the [official website](https://www.terraform.io/downloads.html).
- AWS CLI installed on your local machine. You can download AWS CLI from the [official website](https://aws.amazon.com/cli/).

## Getting Started

To get started with provisioning the three-tier app with a bastion host, follow the steps below:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/sundesz/vpc-ec2-rds.git
   ```

2. Navigate to the project directory:

   ```bash
   cd vpc-ec2-rds
   ```

3. Set up your AWS CLI credentials by running the following command:

   ```bash
   aws configure
   ```

   Provide your AWS Access Key ID, AWS Secret Access Key, default region name, and output format when prompted. These credentials will be used by Terraform to authenticate with AWS.

4. Change the file permission of the key pair file:

   ```bash
   chmod 400 aws_test_key.pem
   ```

5. Open the `variables.tf` file and review the variables. Adjust them according to your requirements, such as AWS region, instance types, database settings, etc.

6. Run Terraform to create the infrastructure:

   ```bash
   terraform init
   terraform apply
   ```

   Review the plan and enter `yes` to proceed with the resource creation.

7. Terraform will provision the following resources in AWS:

   - Bastion host (EC2 instance) in a public subnet
   - Web server (EC2 instance) in a public subnet
   - Application server (EC2 instance) in a public subnet
   - RDS database instance in a private subnet

8. Once the Terraform run is complete, the public IP addresses of the bastion host, web server, and application server will be displayed in the console output.

9. To connect to the bastion host using SSH, use the following command:

   ```bash
   chmod 400 aws_test_key.pem
   ssh -i aws_test_key.pem ec2-user@<bastion-public-ip>
   ```

   The private key file `aws_test_key.pem` for SSH access to the bastion host is automatically generated during the Terraform run.

10. From the bastion host, you can SSH into the web server and application server using their public IP addresses.

## Accessing the RDS Database

The RDS database instance is provisioned within a private subnet and is not directly accessible from the internet. To access the database, you can configure your application to use the RDS endpoint and appropriate credentials.

## Cleanup

To remove all the resources created by Terraform, run the following command:

```bash
terraform destroy
```

Review the plan and enter `yes` to confirm the deletion of the resources.

**Note:** Be cautious when running the `terraform destroy` command, as it will delete all the infrastructure provisioned by Terraform.

## Conclusion

Congratulations! You have successfully deployed a three-tier application with a bastion host using Terraform on AWS.
