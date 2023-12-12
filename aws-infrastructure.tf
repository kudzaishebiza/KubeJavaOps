# aws-infrastructure.tf

provider "aws" {
  region = "us-east-1" # Change to your desired region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

# Create Subnets
resource "aws_subnet" "my_subnet" {
  count = 2

  cidr_block = "10.0.${count.index + 1}.0/24"
  vpc_id     = aws_vpc.my_vpc.id

  availability_zone = "us-east-1a" # Change as needed

  map_public_ip_on_launch = true

  tags = {
    Name = "MySubnet-${count.index + 1}"
  }
}

# Create Security Group
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

# Create EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Specify a valid AMI ID
  instance_type = "t2.micro"
  key_name      = "terraformkeypair"   # Specify your key pair name
  subnet_id     = aws_subnet.my_subnet[0].id

  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  user_data = <<-EOF
              #!/bin/bash
              # to add user data later
              EOF

  tags = {
    Name = "MyEC2Instance"
  }
}
