
# PARENT MODULE VARIABLE

variable "vpc_cidr_block" {
    type =string
    description = "the cidr block of the vpc"
}

variable "instance_type" {
    type = string
    description = "instance type to be launch when autoscaling"
} 

variable "key_name" {
    type = string
    description = "keyname to be used with asg"
}

variable "region" {
    type = string
    description = "Region where the template will be lauch"
}