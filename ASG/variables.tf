# MODULE ASG VARIABLE

variable "image_id" {
    type = string
    description = "image to use with launch template"
    default = "ami-0b5eea76982371e91"            # (OPTIONAL)
}

variable "instance_type" {
    type = string
    description = "type of instances to use with launch template"    #  (REQUIRED)
}

variable "key_name" {
    type = string
    description = "preexisting key to be used in LT"       #  (REQUIRED) 
}

variable "availability_zones" {
    type = list(string)                   
    description = "List of one or more availability zones for the group"      #  (REQUIRED)
}

variable "availability_zone" {
    type = string
    description = "Instances AZ"
    default = "us-east-1a"          # (OPTIONAL)
}

variable "name"{
    type = string
    description = "name of the LT"     #  (REQUIRED)
}

variable "monitoring" {
    type = bool
    description = "enable detailed monitoring"          # (OPTIONAL)
    default = true
}

variable "public_ip_address" {
    type = bool
    description = "associate instance with a public ip address"         # (OPTIONAL)
    default = true
}

variable "resource_type"{
    type = string
    description = "The type of resource to tag"          # (OPTIONAL)
    default = "instance"
}

