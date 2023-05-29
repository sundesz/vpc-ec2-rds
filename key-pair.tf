# To genereate keypair using ssh enter the following command
# ssh-keygen -t ed25519

# resource "aws_key_pair" "key_pair" {
#   key_name   = "aws_test_key"
#   public_key = file("~/.ssh/aws_test_key.pub")
# }


# Generates a secure private key and encodes it as PEM

# resource "tls_private_key" "ed25519-example" {
#   algorithm = "ED25519"
# }
resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create the Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "aws_test_key"
  public_key = tls_private_key.key_pair.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.key_pair.key_name}.pem"
  content  = tls_private_key.key_pair.private_key_pem
}