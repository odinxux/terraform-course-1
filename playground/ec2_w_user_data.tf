resource "aws_instance" "user_data" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_types.t3nano

  subnet_id    = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = [aws_security_group.all_ec2_rules.id]

  # the public SSH key
  key_name = aws_key_pair.odin.key_name

  # user data
  user_data = data.cloudinit_config.cloudinit-example.rendered
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-2a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.ebs-volume-1.id
  instance_id  = aws_instance.user_data.id
  skip_destroy = true                            # skip destroy to avoid issues with terraform destroy
}

