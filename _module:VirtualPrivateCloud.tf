#########################################################
# MODULE: VirtualPrivateCloud
#########################################################
locals {
  _checkVirtualPrivateCloud = length([for i in var.VirtualPrivateCloud : i if i.tags[1] == var.main_id]) != 0 ? [for i in var.VirtualPrivateCloud : i if i.tags[1] == var.main_id] : []
  VirtualPrivateCloud       = local.CountAvailabilityZones != 0 ? local._checkVirtualPrivateCloud : []
}

module "VirtualPrivateCloud" {
  source              = "./modules/VirtualPrivateCloud"
  VirtualPrivateCloud = local.CountAvailabilityZones != 0 ? local._checkVirtualPrivateCloud : []
}

locals {
  vpc_id              = length(module.VirtualPrivateCloud.output) != 0 ? module.VirtualPrivateCloud.output[0].id : ""
  vpc_ipv6_cidr_block = length(module.VirtualPrivateCloud.output) != 0 ? module.VirtualPrivateCloud.output[0].ipv6_cidr_block : ""
}
