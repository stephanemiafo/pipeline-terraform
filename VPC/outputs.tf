
# CHILD MODULE VPC OUTPUT

output "SG_id" {
    value = aws_security_group.pipe_sg.id 
    description = "the sg id "
}

output "vpc_id" {
    value = aws_vpc.pipe_vpc.id
    description = "the vpc id"
}

output "pub_subnet_id" {
    value = aws_subnet.pub_subnet[*].id
    description = "the list of public subnet ids"
}

output "pub_sub_cidr" {
    value = aws_subnet.pub_subnet[*].cidr_block 
    description = "the list of public subnet cidrs"
}

output "pub_sub_az" {
    value = aws_subnet.pub_subnet[*].availability_zone
    description = "the list of public subnet AZs"
}

