#########################################################
# DATA: AvailabilityZones
#########################################################
data "aws_availability_zones" "AvailabilityZones" {
  state = "available"
}

locals {
  _checkCountAvailabilityZones = var.availability_zones <= length(data.aws_availability_zones.AvailabilityZones.names) ? var.availability_zones : 0
  CountAvailabilityZones       = local._checkCountAvailabilityZones > 1 ? var.availability_zones : 0
}
