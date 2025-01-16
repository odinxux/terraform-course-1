resource "aws_key_pair" "odin" {
  key_name   = "odin"
  public_key = file(var.SSH_PUBLIC_KEY_PATH)
}