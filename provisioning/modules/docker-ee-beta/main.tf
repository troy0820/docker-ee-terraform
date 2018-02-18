resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

data "template_file" init {
  template      = "${file("${path.module}/scripts/user-data.tpl")}"
}

resource "aws_instance" "docker-beta"{
  depends_on    = ["null_resource.is_ready"]

  count         = "${var.count}"
  ami	        = "${var.ami}"
  instance_type = "t2.medium"
  key_name      = "${var.key_name}"
  subnet_id     = "${var.subnet_id}"

tags {
  Owner         = "${var.owner}"
  Purpose       = "${var.purpose}"
  Name 		= "${var.name}"
 }

  user_data 	= "${data.template_file.init.rendered}"
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready",
	"aws_instance.docker-beta"]
}
