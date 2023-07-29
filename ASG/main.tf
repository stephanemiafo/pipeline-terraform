# CHILD MODULE ASG MAIN

resource "aws_launch_template" "asg_webserver" {
  name = var.name  # "LT_for_asg"
  image_id = var.image_id  # "ami-0b5eea76982371e91"
  instance_type = var.instance_type   #  "t2.micro"
  key_name = var.key_name   # "controler"
  monitoring {
    enabled = var.monitoring      # true
  }
  network_interfaces {
    associate_public_ip_address = var.public_ip_address    # true
  }
  placement {
    availability_zone = var.availability_zone   #  "us-east-1a"
  }
  # vpc_security_group_ids = [aws_security_group.pipe_sg.id]  
  tag_specifications {
    resource_type = var.resource_type        # "instance"
    tags = {
      Name = "asg_webservver-${var.name}"
    }
  }

}

resource "aws_autoscaling_group" "asg_webserver" {
  name = "asg_webserver"
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  availability_zones = var.availability_zones
  # vpc_zone_identifier = [var.vpc_zone_identifier] 
  launch_template {
    id      = aws_launch_template.asg_webserver.id
    version = "$Latest"
  }
}



# REFERENCE A MODULE IN A RESOURCE BLOCK 

# METHOD 1:
# To reference a module in the resource block in Terraform, 
# you can use the module keyword followed by the name of the 
# module and the resource within the module that you want to reference. 
# For example, if you have a module named vpc with a resource of 
# type aws_vpc named vpc, you can reference it in your resource block like this:

# resource "aws_subnet" "subnet" {
#   vpc_id = module.vpc.vpc_id         # module.vpc.pipe_vpc_id
#   cidr_block = "10.0.1.0/24"
# }

# METHOD 2:
# You can also use the output values from a module 
# in your resource block. For example, if you have an 
# output named vpc_id in your vpc module, you can 
# reference it like this:

# resource "aws_subnet" "subnet" {
#   vpc_id = module.vpc.outputs.vpc_id
#   cidr_block = "10.0.1.0/24"
# }
