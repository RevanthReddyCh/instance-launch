resource "aws_vpc" "myvpc2" {
  cidr_block = "172.0.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Starbucks-vpc"
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.myvpc2.id
  cidr_block              = "172.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "use-2-subnet"
  }
}

# resource "aws_subnet" "public_subnet2" {
#   vpc_id                  = aws_vpc.myvpc2.id
#   cidr_block              = "172.0.2.0/24"
#   availability_zone       = "us-west-2b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "usw-2-subnet"
#   }
# }

# resource "null_resource" "install_nginx" {
#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("/us-west-2.pem")  
#     host        = aws_instance.public_instance.public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt-get update",
#       "sudo apt-get install -y nginx"
#     ]
#   }
# }