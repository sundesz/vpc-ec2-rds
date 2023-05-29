# 1. Create vpc
# 2. Create Internet Gateway
# 3. Create Custom Route Table
# 4. Create a Subnet
# 5. Associate subnet with Route Table
# 6. Create Security Group to allow port 22,80,443
# 7. Create a network interface with an ip in the subnet that was created in step 4
# 8. Assign an elastic IP to the network interface created in step 7
# 9. Create Ubuntu server and install/enable apache2


# vpc enabble dnshostname
# subnet Enable auto-assign public IPv4 address

# -var-file="dev.tfvars"

# https://www.youtube.com/watch?v=iRaai1IBlB0
# Learn Terraform (and AWS) by Building a Dev Environment – Full Course for Beginners


# https://medium.com/nerd-for-tech/two-tier-architecture-deployment-with-terraform-14252c938736
# https://aws.plainenglish.io/terraform-with-ec2-instances-a7e31571a058