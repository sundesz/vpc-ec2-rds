data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*", ]
  }
}


data "aws_ami" "amazon-linux-2-kernel-5" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5*"]
  }
}

# data "template_file" "init" {
#   template = file("userdata_application.sh")
#   vars = {
#     db_host_name = "${aws_db_instance.dbinstance.address}",
#     db_user_name = "main"
#   }
# }