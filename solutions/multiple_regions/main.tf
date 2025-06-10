# us-south
locals {
  us_south_config = { for k, v in var.region_config : k => v if k == "ibm.us-south" }
}

data "ibm_is_vpc" "vpc_us_south" {
  for_each = local.us_south_config
  name     = each.value.vpc_name
  provider = ibm.us-south
}

module "vpe_us_south" {
  source   = "../.."
  for_each = local.us_south_config
  providers = {
    ibm = ibm.us-south
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_us_south[each.key].id
  subnet_zone_list     = local.subnet_zone_list_us_south
  resource_group_id    = module.resource_group_us_south[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_us_south" {
  for_each                     = local.us_south_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.us-south
  }
}

data "ibm_is_subnet" "subnet_us_south" {
  for_each = {
    for region_key, cfg in local.us_south_config :
    "us-south-${cfg.subnet_ids[0]}" => {
      region    = "us-south"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.us-south
}


locals {
  subnet_zone_list_us_south = [for subnet in data.ibm_is_subnet.subnet_us_south : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end us-south


#au-syd

locals {
  au-syd_config = { for k, v in var.region_config : k => v if k == "au-syd" }
}

data "ibm_is_vpc" "vpc_au-syd" {
  for_each = local.au-syd_config
  name     = each.value.vpc_name
  provider = ibm.au-syd
}

module "vpe_au-syd" {
  source   = "../.."
  for_each = local.au-syd_config
  providers = {
    ibm = ibm.au-syd
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_au-syd[each.key].id
  subnet_zone_list     = local.subnet_zone_list_au-syd
  resource_group_id    = module.resource_group_au-syd[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_au-syd" {
  for_each                     = local.au-syd_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.au-syd
  }
}

data "ibm_is_subnet" "subnet_au-syd" {
  for_each = {
    for region_key, cfg in local.au-syd_config :
    "au-syd-${cfg.subnet_ids[0]}" => {
      region    = "au-syd"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.au-syd
}


locals {
  subnet_zone_list_au-syd = [for subnet in data.ibm_is_subnet.subnet_au-syd : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end au-syd

#eu-de

locals {
  eu-de_config = { for k, v in var.region_config : k => v if k == "eu-de" }
}

data "ibm_is_vpc" "vpc_eu-de" {
  for_each = local.eu-de_config
  name     = each.value.vpc_name
  provider = ibm.eu-de
}

module "vpe_eu-de" {
  source   = "../.."
  for_each = local.eu-de_config
  providers = {
    ibm = ibm.eu-de
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_eu-de[each.key].id
  subnet_zone_list     = local.subnet_zone_list_eu-de
  resource_group_id    = module.resource_group_eu-de[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_eu-de" {
  for_each                     = local.eu-de_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.eu-de
  }
}

data "ibm_is_subnet" "subnet_eu-de" {
  for_each = {
    for region_key, cfg in local.eu-de_config :
    "eu-de-${cfg.subnet_ids[0]}" => {
      region    = "eu-de"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.eu-de
}


locals {
  subnet_zone_list_eu-de = [for subnet in data.ibm_is_subnet.subnet_eu-de : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end eu-de

#eu-gb

locals {
  eu-gb_config = { for k, v in var.region_config : k => v if k == "eu-gb" }
}

data "ibm_is_vpc" "vpc_eu-gb" {
  for_each = local.eu-gb_config
  name     = each.value.vpc_name
  provider = ibm.eu-gb
}

module "vpe_eu-gb" {
  source   = "../.."
  for_each = local.eu-gb_config
  providers = {
    ibm = ibm.eu-gb
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_eu-gb[each.key].id
  subnet_zone_list     = local.subnet_zone_list_eu-gb
  resource_group_id    = module.resource_group_eu-gb[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_eu-gb" {
  for_each                     = local.eu-gb_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.eu-gb
  }
}

data "ibm_is_subnet" "subnet_eu-gb" {
  for_each = {
    for region_key, cfg in local.eu-gb_config :
    "eu-gb-${cfg.subnet_ids[0]}" => {
      region    = "eu-gb"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.eu-gb
}


locals {
  subnet_zone_list_eu-gb = [for subnet in data.ibm_is_subnet.subnet_eu-gb : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end eu-gb

#jp-osa

locals {
  jp-osa_config = { for k, v in var.region_config : k => v if k == "jp-osa" }
}

data "ibm_is_vpc" "vpc_jp-osa" {
  for_each = local.jp-osa_config
  name     = each.value.vpc_name
  provider = ibm.jp-osa
}

module "vpe_jp-osa" {
  source   = "../.."
  for_each = local.jp-osa_config
  providers = {
    ibm = ibm.jp-osa
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_jp-osa[each.key].id
  subnet_zone_list     = local.subnet_zone_list_jp-osa
  resource_group_id    = module.resource_group_jp-osa[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_jp-osa" {
  for_each                     = local.jp-osa_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.jp-osa
  }
}

data "ibm_is_subnet" "subnet_jp-osa" {
  for_each = {
    for region_key, cfg in local.jp-osa_config :
    "jp-osa-${cfg.subnet_ids[0]}" => {
      region    = "jp-osa"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.jp-osa
}


locals {
  subnet_zone_list_jp-osa = [for subnet in data.ibm_is_subnet.subnet_jp-osa : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end jp-osa

#jp-tok

locals {
  jp-tok_config = { for k, v in var.region_config : k => v if k == "jp-tok" }
}

data "ibm_is_vpc" "vpc_jp-tok" {
  for_each = local.jp-tok_config
  name     = each.value.vpc_name
  provider = ibm.jp-tok
}

module "vpe_jp-tok" {
  source   = "../.."
  for_each = local.jp-tok_config
  providers = {
    ibm = ibm.jp-tok
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_jp-tok[each.key].id
  subnet_zone_list     = local.subnet_zone_list_jp-tok
  resource_group_id    = module.resource_group_jp-tok[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_jp-tok" {
  for_each                     = local.jp-tok_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.jp-tok
  }
}

data "ibm_is_subnet" "subnet_jp-tok" {
  for_each = {
    for region_key, cfg in local.jp-tok_config :
    "jp-tok-${cfg.subnet_ids[0]}" => {
      region    = "jp-tok"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.jp-tok
}


locals {
  subnet_zone_list_jp-tok = [for subnet in data.ibm_is_subnet.subnet_jp-tok : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end jp-tok

#br-sao

locals {
  br-sao_config = { for k, v in var.region_config : k => v if k == "br-sao" }
}

data "ibm_is_vpc" "vpc_br-sao" {
  for_each = local.br-sao_config
  name     = each.value.vpc_name
  provider = ibm.br-sao
}

module "vpe_br-sao" {
  source   = "../.."
  for_each = local.br-sao_config
  providers = {
    ibm = ibm.br-sao
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_br-sao[each.key].id
  subnet_zone_list     = local.subnet_zone_list_br-sao
  resource_group_id    = module.resource_group_br-sao[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_br-sao" {
  for_each                     = local.br-sao_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.br-sao
  }
}

data "ibm_is_subnet" "subnet_br-sao" {
  for_each = {
    for region_key, cfg in local.br-sao_config :
    "br-sao-${cfg.subnet_ids[0]}" => {
      region    = "br-sao"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.br-sao
}


locals {
  subnet_zone_list_br-sao = [for subnet in data.ibm_is_subnet.subnet_br-sao : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end br-sao

#ca-tor

locals {
  ca-tor_config = { for k, v in var.region_config : k => v if k == "ca-tor" }
}

data "ibm_is_vpc" "vpc_ca-tor" {
  for_each = local.ca-tor_config
  name     = each.value.vpc_name
  provider = ibm.ca-tor
}

module "vpe_ca-tor" {
  source   = "../.."
  for_each = local.ca-tor_config
  providers = {
    ibm = ibm.ca-tor
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_ca-tor[each.key].id
  subnet_zone_list     = local.subnet_zone_list_ca-tor
  resource_group_id    = module.resource_group_ca-tor[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_ca-tor" {
  for_each                     = local.ca-tor_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.ca-tor
  }
}

data "ibm_is_subnet" "subnet_ca-tor" {
  for_each = {
    for region_key, cfg in local.ca-tor_config :
    "ca-tor-${cfg.subnet_ids[0]}" => {
      region    = "ca-tor"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.ca-tor
}


locals {
  subnet_zone_list_ca-tor = [for subnet in data.ibm_is_subnet.subnet_ca-tor : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end ca-tor

#eu-es

locals {
  eu-es_config = { for k, v in var.region_config : k => v if k == "eu-es" }
}

data "ibm_is_vpc" "vpc_eu-es" {
  for_each = local.eu-es_config
  name     = each.value.vpc_name
  provider = ibm.eu-es
}

module "vpe_eu-es" {
  source   = "../.."
  for_each = local.eu-es_config
  providers = {
    ibm = ibm.eu-es
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_eu-es[each.key].id
  subnet_zone_list     = local.subnet_zone_list_eu-es
  resource_group_id    = module.resource_group_eu-es[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_eu-es" {
  for_each                     = local.eu-es_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.eu-es
  }
}

data "ibm_is_subnet" "subnet_eu-es" {
  for_each = {
    for region_key, cfg in local.eu-es_config :
    "eu-es-${cfg.subnet_ids[0]}" => {
      region    = "eu-es"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.eu-es
}


locals {
  subnet_zone_list_eu-es = [for subnet in data.ibm_is_subnet.subnet_eu-es : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end eu-es

#us-east

locals {
  us-east_config = { for k, v in var.region_config : k => v if k == "us-east" }
}

data "ibm_is_vpc" "vpc_us-east" {
  for_each = local.us-east_config
  name     = each.value.vpc_name
  provider = ibm.us-east
}

module "vpe_us-east" {
  source   = "../.."
  for_each = local.us-east_config
  providers = {
    ibm = ibm.us-east
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_us-east[each.key].id
  subnet_zone_list     = local.subnet_zone_list_us-east
  resource_group_id    = module.resource_group_us-east[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_us-east" {
  for_each                     = local.us-east_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.us-east
  }
}

data "ibm_is_subnet" "subnet_us-east" {
  for_each = {
    for region_key, cfg in local.us-east_config :
    "us-east-${cfg.subnet_ids[0]}" => {
      region    = "us-east"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.us-east
}


locals {
  subnet_zone_list_us-east = [for subnet in data.ibm_is_subnet.subnet_us-east : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end us-east

#eu-fr2

locals {
  eu-fr2_config = { for k, v in var.region_config : k => v if k == "eu-fr2" }
}

data "ibm_is_vpc" "vpc_eu-fr2" {
  for_each = local.eu-fr2_config
  name     = each.value.vpc_name
  provider = ibm.eu-fr2
}

module "vpe_eu-fr2" {
  source   = "../.."
  for_each = local.eu-fr2_config
  providers = {
    ibm = ibm.eu-fr2
  }
  region               = each.key
  vpc_name             = each.value.vpc_name
  vpc_id               = data.ibm_is_vpc.vpc_eu-fr2[each.key].id
  subnet_zone_list     = local.subnet_zone_list_eu-fr2
  resource_group_id    = module.resource_group_eu-fr2[each.key].resource_group_id
  security_group_ids   = each.value.security_group_ids
  cloud_services       = each.value.cloud_services
  cloud_service_by_crn = each.value.cloud_service_by_crn
  service_endpoints    = each.value.service_endpoints
  reserved_ips         = each.value.reserved_ips
}


module "resource_group_eu-fr2" {
  for_each                     = local.eu-fr2_config
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = each.value.resource_group_name
  providers = {
    ibm = ibm.eu-fr2
  }
}

data "ibm_is_subnet" "subnet_eu-fr2" {
  for_each = {
    for region_key, cfg in local.eu-fr2_config :
    "eu-fr2-${cfg.subnet_ids[0]}" => {
      region    = "eu-fr2"
      subnet_id = cfg.subnet_ids[0]
    }
  }
  identifier = each.value.subnet_id
  provider   = ibm.eu-fr2
}


locals {
  subnet_zone_list_eu-fr2 = [for subnet in data.ibm_is_subnet.subnet_eu-fr2 : {
    name = subnet.name
    id   = subnet.id
    zone = subnet.zone
  }]
}

# end eu-fr2