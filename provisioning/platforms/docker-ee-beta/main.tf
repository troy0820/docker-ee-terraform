terraform {
  required_version = "> 0.11.0"
  backend          "s3"             {}
}

provider "aws" {
  version = "~>1.8"
  region  = "${var.region}"
  profile = "${var.profile}"
}

resource "null_resource" "is_ready" {
  triggers {
    is_ready = true
  }
}

resource "aws_vpc" "docker-ee-beta" {
  depends_on = ["null_resource.is_ready"]
  cidr_block = "10.0.0.0/16"

  tags {
    Name    = "${var.name}"
    Purpose = "${var.purpose}"
    Owner   = "${var.owner}"
  }
}

resource "aws_subnet" "docker-ee-beta" {
  depends_on = ["aws_vpc.docker-ee-beta"]
  vpc_id     = "${aws_vpc.docker-ee-beta.id}"
  cidr_block = "10.0.0.0/16"

  tags {
    Name    = "${var.name}"
    Purpose = "${var.purpose}"
    Owner   = "${var.owner}"
  }
}

module "docker-ee-beta" {
  source = "../../modules/docker-ee-beta"

  is_ready   = true
  docker_key = "${var.docker_key}"
  count      = "${var.count}"
  ami        = "${var.ami}"
  key_name   = "${var.key_name}"
  subnet_id  = "${aws_subnet.docker-ee-beta.id}"

  owner   = "${var.owner}"
  purpose = "${var.purpose}"
  name    = "${var.name}"
}
