resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

#########################################################
# Random ID generator for uniq hash
##########################################################
resource "random_id" "s3-bucket" {
  byte_length = 8
}

############################################################
# S3 bucket for storing state
############################################################
resource "aws_s3_bucket" "terraform-state-bucket" {
  depends_on = ["null_resource.is_ready"]
  bucket     = "${var.s3_bucket}-${random_id.s3-bucket.hex}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name        = "${var.name}"
    Description = "${var.s3_tags}"
    Purpose     = "${var.purpose}"
    Owner       = "${var.owner}"
  }
}

############################################################
# Dynamo DB table for locking state
############################################################
resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {
  depends_on     = ["null_resource.is_ready"]
  name           = "${var.dynamo_name}"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Description = "${var.dynamo_tags}"
    Name        = "${var.name}"
    Purpose     = "${var.purpose}"
    Owner       = "${var.owner}"
  }
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready", "aws_dynamodb_table.dynamodb-tf-state-lock", "aws_s3_bucket.terraform-state-bucket"]
}
