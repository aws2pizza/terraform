#########################################################
# DATA: MachineImage
#########################################################
data "aws_ami" "MachineImage" {
  most_recent = true
  name_regex  = "^amzn2-ami-hvm-2.0*"
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
