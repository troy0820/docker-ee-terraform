resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

#########################################################
# Template file with user-data script
#########################################################

data "template_file" init {
  template = "${file("${path.module}/scripts/user-data.tpl")}"

  vars {
    docker_key = "${var.docker_key}"
  }
}

#########################################################
# VPC for Docker EE Beta nodes to reside in
#########################################################

resource "aws_vpc" "docker-ee-beta" {
  depends_on = ["null_resource.is_ready"]
  cidr_block = "10.0.0.0/16"

  tags {
    Name    = "${var.name}"
    Purpose = "${var.purpose}"
    Owner   = "${var.owner}"
  }
}

#########################################################
# Subnet associated with vpc
#########################################################

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

########################################################
# AWS EC2 instance for each docker-ee-beta node
########################################################

resource "aws_instance" "troy-connor-docker-beta-ee" {
  depends_on = ["aws_subnet.docker-ee-beta"]

  count                       = "${var.count}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${aws_subnet.docker-ee-beta.id}"
  associate_public_ip_address = true

  tags {
    Owner   = "${var.owner}"
    Purpose = "${var.purpose}"
    Name    = "${var.name}"
  }

  user_data = "${data.template_file.init.rendered}"
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready", "aws_vpc.docker-ee-beta", "aws_subnet.docker-ee-beta",
    "aws_instance.troy-connor-docker-beta-ee",
  ]
}
