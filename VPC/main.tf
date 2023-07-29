
# CHILD MODULE VPC MAIN

data "aws_availability_zones" "available" {
  state = "available"
}

resource "random_integer" "tag" {
  min = 1
  max = 5000
}

resource "aws_vpc" "pipe_vpc" {
  cidr_block       = var.vpc_cidr     
  enable_dns_support = var.dns_support     # true
  enable_dns_hostnames = var.dns_hostnames  # true
  # tags = merge(var.common_tags, {
  #   Name = "pipe_vpc_${random_integer.tag.id}"
  # })
  tags = {
    Name = "pipe_vpc_${random_integer.tag.id}"
  }
}

resource "aws_subnet" "pub_subnet" {
  count = var.my_count
  vpc_id     = aws_vpc.pipe_vpc.id
  cidr_block  = cidrsubnet(aws_vpc.pipe_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  map_public_ip_on_launch = var.map_public_ip       # true
  tags = {
    Name = "pub-sub_${count.index + 1}"
  }
}

resource "aws_security_group" "pipe_sg" {
  name        = "pipe_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.pipe_vpc.id
  ingress {
    description      = "traffic from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "traffic from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pipe_sg_${random_integer.tag.id}"
  }
}



# data "aws_availability_zones" "available" {
#   state = "available"
# }

# resource "random_integer" "tag" {
#   min = 1
#   max = 5000
# }

# resource "aws_vpc" "pipe_vpc" {
#   cidr_block       = var.vpc_cidr     
#   enable_dns_support = var.dns_support     # true
#   enable_dns_hostnames = var.dns_hostnames  # true
#   tags = merge(var.common_tags, {
#     Name = "pipe_vpc_${random_integer.tag.id}"
#   })
# }

# resource "aws_subnet" "pub_subnet" {
#   count = var.my_count
#   vpc_id     = aws_vpc.pipe_vpc.id
#   cidr_block  = cidrsubnet(var.vpc_cidr, 8, count.index)
#   availability_zone = var.availability_zone
#   map_public_ip_on_launch = var.map_public_ip       # true
#   tags = merge(var.common_tags, {
#     Name = "pub-sub_${count.index + 1}"
#   })
#   depends_on = [aws_vpc.pipe_vpc]
# }
