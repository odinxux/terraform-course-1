terraform {
  required_version = ">= 1.10 "
}
terraform {
  backend "s3" {
    bucket = "odin-tfstate-8.1.25"
    key    = "tfstate/playground/terraform.tfstate"
    use_lockfile = true
    region     = "eu-west-2"
    profile    = "odinux"
  }
}
