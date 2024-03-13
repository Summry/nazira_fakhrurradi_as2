resource "aws_instance" "ec2_instance" {
  count             = var.ec2_count
  ami               = var.ami_id
  instance_type     = "t2.micro"
  key_name          = var.ssh_key_name
  subnet_id         = var.subnet_ids[count.index]
  security_groups   = [var.security_group_id]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name    = "ec2_instance"
    Project = var.project_name
  }
}
