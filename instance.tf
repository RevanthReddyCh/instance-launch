resource "aws_instance" "public_instance" {
  ami           = "ami-0ea3c35c5c3284d82"
  instance_type = "t3.medium"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all_traffic.id}"]

  key_name      = "us-east-2"
  user_data = file("${path.module}/userdata.sh")


  tags = {
    Name = "starbucks"
  }

}

