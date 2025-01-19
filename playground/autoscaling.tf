#resource "aws_launch_configuration" "example-launchconfig" {
#  name_prefix     = "example-launchconfig"
#  image_id        = data.aws_ami.ubuntu.image_id
#  instance_type   = "var.instance_types.t3nano"
#  key_name        = aws_key_pair.odin.key_name
#  security_groups = [aws_security_group.all_ec2_rules.id]
#}
resource "aws_launch_template" "example-launch-template" {
  name_prefix   = "example-launch-template"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"
  key_name      = aws_key_pair.odin.key_name
  vpc_security_group_ids = [aws_security_group.all_ec2_rules.id]
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = "example-autoscaling"
  vpc_zone_identifier       = module.vpc.public_subnets
  #lounch configuration deprected using launch template instead
  #launch_configuration      = aws_launch_configuration.example-launchconfig.name
  launch_template {
    id      = aws_launch_template.example-launch-template.id
    version = "$Latest"
  }
  #we dont need to have running instances so max and min size are set to 0
  min_size                  = 0
  max_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

