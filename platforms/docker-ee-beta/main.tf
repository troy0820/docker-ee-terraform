terraform {
  required_version = "> 0.11.0"
}


provider "aws" {
  version = "~>1.8"
  region  = "${var.region}"
  profile = "${var.profile}"
}

module "docker-ee-beta" {
  source = "../../modules/docker-ee-beta"

  ami	        = "${var.ami}"
  key_name      = "${var.key_name}"
  subnet_id     = "${var.subnet_id}"

  owner         = "${var.owner}"
  purpose       = "${var.purpose}"
  name 		= "${var.name}"

}
