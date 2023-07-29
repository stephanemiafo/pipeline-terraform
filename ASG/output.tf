
# MODULE EC2 OUTPUT

output "asg_id" {
    value = aws_autoscaling_group.asg_webserver.id
}

output "asg_zone_identifier" {
    value = aws_autoscaling_group.asg_webserver.vpc_zone_identifier
}
output "LT_image_id" {
    value = aws_launch_template.asg_webserver.id
}