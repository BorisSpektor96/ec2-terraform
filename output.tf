output "amazon_linux_ami_id" {
  description = "the value of amazon linux 2 AMI"
  value = data.aws_ami.amazon_linux.id
}

output "ec2-instance-id" {
  description = "ec2-instance-id"
  value = aws_instance.name.id
}

output "vpc_id" {
  description = "vpc id"
  value = aws_vpc.my_vpc.id
}