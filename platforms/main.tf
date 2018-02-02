terraform {
  required_version = "> 0.11.0"
}


provider "aws" {
  version = "~>1.8"
  region  = "${var.aws_region}"
  profile = "${var.profile}"
}

