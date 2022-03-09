resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name = var.keypair
  vpc_security_group_ids = [aws_security_group.ec2.id]
}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = module.vpc.public_subnets
  desired_capacity   = 3
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }

  tag {
    key                 = "name"
    value               = "trading-cards"
    propagate_at_launch = true
  }
}

# resource "aws_instance" "web" {
#   count = 3
#   ami           = var.ami
#   instance_type = var.instance_type

#   subnet_id = module.vpc.public_subnets[0]

#   key_name = var.keypair

#   vpc_security_group_ids = [aws_security_group.ec2.id]

#   tags = {
#     Name = "HelloWorld"
#   }
# }