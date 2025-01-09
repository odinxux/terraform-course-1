###vpc network security group setup###
resource "aws_security_group" "ec2_rules" {
  name        = "ec2_rules"
  description = "ec2 instance rules"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "ec2_rules"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.ec2_rules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_any_out" {
  security_group_id = aws_security_group.ec2_rules.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
