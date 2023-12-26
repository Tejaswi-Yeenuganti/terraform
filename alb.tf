####################SETTING_UP_THE_LOAD_BALANCER#############

resource "aws_lb" "prj2_terraform_alb" {
  name               = "prj2-alb"
  internal           = false # Set to true for internal ALB, false for external
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http-ssh.id]                         # Specify your security group ID
  subnets            = [aws_subnet.prj2_pub_sub.id, aws_subnet.prj2_pvt_sub.id] # Specify your subnet IDs
}


#####################CREATING_TARGETGROUP###############


resource "aws_lb_target_group" "prj2_tg" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prj2_terraform.id # Specify your VPC ID

  health_check {
    path                = "/index.html"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 10
  }
}


##################ATTACHING_TARGETGROUP_TO_ALB####################


resource "aws_lb_target_group_attachment" "alb_tg_atch" {
  target_group_arn = aws_lb_target_group.prj2_tg.arn
  target_id        = aws_instance.prj2_web_instance[0].id # Specify the ID of your target instance
}
