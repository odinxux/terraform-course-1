##ec2 instance we setup 
#resource "aws_instance" "tst" {
#  ami           = data.aws_ami.ubuntu.id
#  instance_type = var.instance_type.t3
#  subnet_id    = element(module.vpc.private_subnets, 0)
#  vpc_security_group_ids = [aws_security_group.ec2_rules.id]
#  key_name = aws_key_pair.odin.key_name
#  tags = {
#    Name = "terraform ami auto selection"
#  }
#}
#resource "aws_key_pair" "odin" {
#  key_name   = "odin"
#  public_key = file("~/.ssh/id_rsa.pub")
#}