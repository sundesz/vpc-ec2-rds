# Bastion host
resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.settings.bastion_host.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_1a
  security_groups             = [var.bastion_sg]
  user_data                   = <<EOF





  EOF

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${aws_key_pair.key_pair.key_name}.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "${aws_key_pair.key_pair.key_name}.pem"
    destination = "/home/ec2-user/${aws_key_pair.key_pair.key_name}.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ec2-user/${aws_key_pair.key_pair.key_name}.pem"
    ]
  }

  tags = {
    Name = var.settings.bastion_host.name
  }
}


# Web server
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.settings.web_server.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_1a
  security_groups             = [var.web_sg]

  user_data_base64 = base64encode("${templatefile("${path.module}/userdata/web.sh", {
    app-server-public-dns = aws_instance.application_server.public_ip
  })}")

  tags = {
    Name = var.settings.web_server.name
  }

  depends_on = [aws_instance.application_server]
}


# Application server
resource "aws_instance" "application_server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.settings.app_server.instance_type
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_1a
  security_groups             = [var.web_sg]

  user_data_base64 = base64encode("${templatefile("${path.module}/userdata/application.sh", {
    db_host_name     = var.dbEndpoint,
    db_user_name     = var.settings.database_instance.username,
    db_user_password = var.settings.database_instance.password,
  })}")

  tags = {
    Name = var.settings.app_server.name
  }


  #On the Internet Gateway for the VPC.
  depends_on = [var.db_instance]
}
