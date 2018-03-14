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

########################################################
# AWS EC2 instance for each docker-ee-beta node
########################################################
resource "aws_instance" "troy-connor-docker-beta-ee" {
  depends_on = ["null_resource.is_ready"]

  count                       = "${var.count}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true

  tags {
    Owner   = "${var.owner}"
    Purpose = "${var.purpose}"
    Name    = "${var.name}"
  }

  user_data = "${data.template_file.init.rendered}"
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready",
    "aws_instance.troy-connor-docker-beta-ee",
  ]
}
