resource "aws_instance" "name" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  availability_zone = var.region

  key_name = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ] #your security group id

  tags = {
    Name = "ec2-terraform"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "100.0.0.0/16"

  tags = {
    Name = "my-devops-vpc"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allow ssh to ec2"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "terraform-allow-ssh"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.name.id
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.region
  size = var.ebs_volume_size
  tags = {
    Name = "ebs-terraform"
  }
}