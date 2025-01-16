#fetch latest ubuntu 24.04 ami
data "aws_ami" "ubuntu" {
  most_recent = true
  name_regex       = "^ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
