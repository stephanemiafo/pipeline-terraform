
# CHILD MODULE VPC VARIABLE

variable "vpc_cidr" {
  type = string
  description = "the CIDR of the vpc"     # (REQUIRED)
}

variable "dns_support" {
  type = bool
  description = "DNS support in the VPC"    # (OPTIONAL)
  default = true
}

variable "dns_hostnames" {
  type = bool
  description = "DNS hostnames in the VPC"     # (OPTIONAL)
  default = true
}
variable "my_count" {
  type = number
  description = "number of public subnet to create"       # (OPTIONAL)
  default = 3
}

variable "map_public_ip" {
  type = bool
  description = "indicate that instances launched into the subnet should be assigned a public IP address"     # (OPTIONAL)
  default = true
}

