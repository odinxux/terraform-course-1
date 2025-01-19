##ec2 instances we setup 
#resource "aws_spot_instance_request" "spot" {
#  ami           = data.aws_ami.ubuntu.id
#  spot_price = "0.003"
#  instance_type = var.instance_types.t3nano
#  subnet_id    = element(module.vpc.public_subnets, 0)
#  vpc_security_group_ids = [aws_security_group.all_ec2_rules.id]
#  key_name = aws_key_pair.odin.key_name
#  tags = {
#    Name = "ec2 spot instance"
#  }
#}
##default user key location
#resource "aws_key_pair" "odin" {
#  key_name   = "odin"
#  public_key = file("~/.ssh/id_rsa.pub")
#}