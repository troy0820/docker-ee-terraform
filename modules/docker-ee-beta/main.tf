data "template_file" init {
  template      = "${file("${path.module}/scripts/user-data.tpl")}"
}

resource "aws_instance" "docker-beta"{
  count         = 3
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
