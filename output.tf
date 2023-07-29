
# PARENT MODULE OUTPUT

output "vpc_id" {
    value = module.vpc.vpc_id
    description = "the id of the vpc"
}

output "asg_id" {
    value = module.asg.asg_id
    description = "the id of the asg"
}

