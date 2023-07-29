
# PARENT MODULE MAIN

module "vpc" {
  source = "./VPC"  
  vpc_cidr = var.vpc_cidr_block         

}

module "asg" {
  source = "./ASG"  
  name = "my_asg_pipeline"
  instance_type   = var.instance_type 
  key_name = var.key_name
  availability_zones = module.vpc.pub_sub_az
}

