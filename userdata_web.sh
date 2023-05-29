#!/bin/bash
sudo yum update -y

sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash -
sudo yum install -y nodejs

sudo yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo "<html><h1>Ma hu Sandesh Hyoju! $(hostname -f)</h1></html>" > /var/www/html/index.html

sudo yum install git -y


cd /home/ec2-user
su ec2-user -c "git clone https://github.com/monir-uz-zaman/aws_frontend.git"

cd /home/ec2-user/aws_frontend/src/lib
sed -i 's/localhost/${app-server-public-dns}/' getBaseRoute.js

cd /home/ec2-user/aws_frontend
echo "NEXT_PUBLIC_BACKEND_URL=http://${app-server-public-dns}:8080" > .env

cd /home/ec2-user/aws_frontend

sudo npm i
sudo npm run dev