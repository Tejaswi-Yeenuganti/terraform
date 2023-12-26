#############CREATING_ASG########################
##
#######SETTING_UP_LAUNCH_TEMPLATE################

resource "aws_launch_configuration" "prj2_lc" {
  name_prefix   = "pjr2-lc-1"
  image_id      = "ami-0ee4f2271a4df2d7d" # Replace with your desired AMI ID
  instance_type = "t2.micro"              # Replace with your desired instance type
}

################SETTING_UP_ASG#############

resource "aws_autoscaling_group" "prj2_asg" {
  name                 = "prj2-asg-1"
  min_size             = 2
  max_size             = 5
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.prj2_lc.name
  vpc_zone_identifier  = [aws_subnet.prj2_pub_sub.id, aws_subnet.prj2_pvt_sub.id] # Replace with your desired subnet IDs
}

#################DEFINING_SCALING_POLICY##############

resource "aws_autoscaling_policy" "prj2_terraform_sp" {
  name                   = "prj2-scale-policy"
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  autoscaling_group_name = aws_autoscaling_group.prj2_asg.name

}
