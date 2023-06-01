# Bastion host
resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.settings.bastion_host.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-subnet-1a.id
  security_groups             = [aws_security_group.bastion_host_sg.id]

  tags = {
    Name = var.settings.bastion_host.name
  }

  depends_on = [aws_instance.application-server]
}


# Web server
resource "aws_instance" "web-server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.settings.web_server.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-subnet-1a.id
  security_groups             = [aws_security_group.web_sg.id]
  # user_data                   = filebase64("userdata_web.sh")

  user_data_base64 = base64encode("${templatefile("userdata_web.sh", {
    app-server-public-dns = aws_instance.application-server.public_ip
  })}")

  tags = {
    Name = var.settings.web_server.name
  }

  depends_on = [aws_instance.application-server]
}


# Application server
resource "aws_instance" "application-server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.settings.app_server.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public-subnet-1a.id
  security_groups             = [aws_security_group.web_sg.id]
  # user_data                   = filebase64("userdata_application.sh")

  user_data_base64 = base64encode("${templatefile("userdata_application.sh", {
    db_host_name     = aws_db_instance.dbinstance.address,
    db_user_name     = var.settings.database_instance.username,
    db_user_password = var.settings.database_instance.password,
  })}")

  tags = {
    Name = var.settings.app_server.name
  }


  #On the Internet Gateway for the VPC.
  depends_on = [aws_db_instance.dbinstance]
}
