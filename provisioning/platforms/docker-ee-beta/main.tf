data "aws_caller_identity" "current" {}

terraform {
  required_version = "> 0.11.0"
  backend          "s3"             {}
}

provider "aws" {
  version = "~>1.8"
  region  = "${var.region}"
  profile = "${var.profile}"
}

module "docker-ee-beta" {
  source = "../../modules/docker-ee-beta"

  is_ready   = true
  docker_key = "${var.docker_key}"
  cidr_block = "${var.cidr_block}"
  count      = "${var.count}"
  ami        = "${var.ami}"
  key_name   = "${var.key_name}"
  owner      = "${var.owner}"
  purpose    = "${var.purpose}"
  name       = "${var.name}"
}
