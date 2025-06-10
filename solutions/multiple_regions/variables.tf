
variable "region_config" {
  type = map(object({
    provider             = string
    resource_group_name  = string
    prefix               = string
    vpc_name             = string
    subnet_ids           = list(string)
    security_group_ids   = list(string)
    cloud_services       = optional(set(object({
    service_name                 = string
    vpe_name                     = optional(string), # Full control on the VPE name. If not specified, the VPE name will be computed based on prefix, vpc name and service name.
    allow_dns_resolution_binding = optional(bool, false)
  })))
    cloud_service_by_crn = optional(set(
    object({
      crn                          = string
      vpe_name                     = optional(string) # Full control on the VPE name. If not specified, the VPE name will be computed based on prefix, vpc name and service name.
      service_name                 = optional(string) # Name of the service used to compute the name of the VPE. If not specified, the service name will be obtained from the crn.
      allow_dns_resolution_binding = optional(bool, true)
    })
  ))
    service_endpoints    = optional(string)
    reserved_ips         = optional(object({
    name = optional(string) # reserved ip name
  }))
  }))
}

variable "ibm_cloud_api_key" {
  default = ""
}
