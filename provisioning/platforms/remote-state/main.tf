terraform {
  required_version = "> 0.11.0"
}

provider "aws" {
  version = "~>1.8"
  region  = "${var.region}"
  profile = "${var.profile}"
}

module "aws-remote-state" {
  source = "../../modules/aws-remote-state"

  is_ready    = true
  s3_bucket   = "${var.s3_bucket}"
  s3_tags     = "${var.s3_tags}"
  dynamo_name = "${var.dynamo_name}"
  dynamo_tags = "${var.dynamo_tags}"
}
