#########################################################
# MODULE: Subnet
#########################################################
locals {
  _checkSubnet = length([for i in var.Subnet : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.Subnet : i if i.tags[1] == var.main_id] : []
}

module "SubnetA" {
  source              = "./modules/Subnet"
  region              = var.region
  vpc_id              = local.CountAvailabilityZones >= 1 ? local.vpc_id : ""
  vpc_ipv6_cidr_block = local.CountAvailabilityZones >= 1 ? local.vpc_ipv6_cidr_block : ""
  Subnet              = local.CountAvailabilityZones >= 1 ? [for i in local._checkSubnet : i if i.tags[4] == "a"] : []
}
module "SubnetB" {
  source              = "./modules/Subnet"
  region              = var.region
  vpc_id              = local.CountAvailabilityZones >= 2 ? local.vpc_id : ""
  vpc_ipv6_cidr_block = local.CountAvailabilityZones >= 1 ? local.vpc_ipv6_cidr_block : ""
  Subnet              = local.CountAvailabilityZones >= 2 ? [for i in local._checkSubnet : i if i.tags[4] == "b"] : []
}
module "SubnetC" {
  source              = "./modules/Subnet"
  region              = var.region
  vpc_id              = local.CountAvailabilityZones >= 3 ? local.vpc_id : ""
  vpc_ipv6_cidr_block = local.CountAvailabilityZones >= 1 ? local.vpc_ipv6_cidr_block : ""
  Subnet              = local.CountAvailabilityZones >= 3 ? [for i in local._checkSubnet : i if i.tags[4] == "c"] : []
}
module "SubnetD" {
  source              = "./modules/Subnet"
  region              = var.region
  vpc_id              = local.CountAvailabilityZones >= 4 ? local.vpc_id : ""
  vpc_ipv6_cidr_block = local.CountAvailabilityZones >= 1 ? local.vpc_ipv6_cidr_block : ""
  Subnet              = local.CountAvailabilityZones >= 4 ? [for i in local._checkSubnet : i if i.tags[4] == "d"] : []
}
module "SubnetE" {
  source              = "./modules/Subnet"
  region              = var.region
  vpc_id              = local.CountAvailabilityZones >= 5 ? local.vpc_id : ""
  vpc_ipv6_cidr_block = local.CountAvailabilityZones >= 1 ? local.vpc_ipv6_cidr_block : ""
  Subnet              = local.CountAvailabilityZones >= 5 ? [for i in local._checkSubnet : i if i.tags[4] == "e"] : []
}
module "SubnetF" {
  source              = "./modules/Subnet"
  region              = var.region
  vpc_id              = local.CountAvailabilityZones >= 6 ? local.vpc_id : ""
  vpc_ipv6_cidr_block = local.CountAvailabilityZones >= 1 ? local.vpc_ipv6_cidr_block : ""
  Subnet              = local.CountAvailabilityZones >= 6 ? [for i in local._checkSubnet : i if i.tags[4] == "f"] : []
}

locals {
  SubnetA = local.CountAvailabilityZones >= 1 ? module.SubnetA.output : []
  SubnetB = local.CountAvailabilityZones >= 2 ? module.SubnetB.output : []
  SubnetC = local.CountAvailabilityZones >= 3 ? module.SubnetC.output : []
  SubnetD = local.CountAvailabilityZones >= 4 ? module.SubnetD.output : []
  SubnetE = local.CountAvailabilityZones >= 5 ? module.SubnetE.output : []
  SubnetF = local.CountAvailabilityZones >= 6 ? module.SubnetF.output : []
  SubnetAll = local.CountAvailabilityZones != 0 ? concat(local.SubnetA,
    local.SubnetB,
    local.SubnetC,
    local.SubnetD,
    local.SubnetE,
  local.SubnetF) : []
}
