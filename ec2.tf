locals {
  DB_HOST_NAME   = aws_db_instance.dbinstance.address
  app-server-public-dns = aws_instance.application-server.public_dns
  app-server-private-ip = aws_instance.application-server.private_ip
}


resource "aws_instance" "web-server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.ec2_type
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.public-subnet-1a.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.web_sg.id]
  # user_data                   = filebase64("userdata_web.sh")

 user_data_base64 = base64encode("${templatefile("userdata_web.sh", {
    app-server-public-dns   = local.app-server-private-ip
  })}")

  tags = {
    Name = "Frontend"
  }

  depends_on = [aws_instance.application-server]
}


resource "aws_instance" "application-server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.ec2_type
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = aws_subnet.private-subnet-1a.id
  security_groups             = [aws_security_group.application_sg.id]
  # user_data                   = filebase64("userdata_application.sh")

 user_data_base64 = base64encode("${templatefile("userdata_application.sh", {
    db_host_name   = local.DB_HOST_NAME,
    db_user_name   = "main",
    db_user_password   = "lab-password",
  })}")

  tags = {
    Name = "Backend"
  }


  #On the Internet Gateway for the VPC.
  depends_on = [aws_db_instance.dbinstance]
}





# create a bastion server
# create a web server
# create a database server