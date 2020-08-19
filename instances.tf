resource "aws_instance" "wp" {
  ami           = "ami-000cbce3e1b899ebd"
  instance_type = "t2.micro"
  key_name = "mykey12"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.id
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.wordpress.id]
 
  tags = {
    Name = "wordpress"
  }
}


resource "aws_instance" "Mysql" {
  ami           = "ami-0b5bff6d9495eff69"
  instance_type = "t2.micro"
  key_name = "mykey12"
  associate_public_ip_address = false
  subnet_id = aws_subnet.subnet2.id
  availability_zone = "ap-south-1b"
  vpc_security_group_ids = [aws_security_group.mysql.id]
  tags = {
    Name = "mysql"
  }
}

resource "aws_instance" "Bastion" {
  ami = "ami-0ebc1ac48dfd14136"
  instance_type = "t2.micro"
  key_name = "mykey12"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.id
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.bastion.id]
 
  tags = {
    Name = "bastion"
  }
}
