# group definition
resource "aws_iam_group" "account_administrators" {
  name = "administrators"
}

resource "aws_iam_policy_attachment" "account_adminidstrators_attach" {
  name       = "administrators--policy-attachment"
  groups     = [aws_iam_group.administrators.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# user
resource "aws_iam_user" "odin" {
  name = "odin"
  path = "/system/"
  tags = {
    user = "account_administrator"
  }
}
resource "aws_iam_access_key" "odin" {
  user    = aws_iam_user.odin.name
  pgp_key = "keybase:odinux"
}
#resource "aws_iam_user" "admin2" {
#  name = "odinux"
#}

resource "aws_iam_group_membership" "administrators-users" {
  name = "administrators-users"
  users = [
    aws_iam_user.odin.name,
  ]
  group = aws_iam_group.account_administrators.name
}

output "warning" {
  value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}

output "secret" {
  value = aws_iam_access_key.odin.encrypted_secret
}