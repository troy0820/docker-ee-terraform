variable "s3_bucket" {
  description = "Tags for Dynamo table"
  type        = "string"
}

variable "s3_tags" {
  description = "Tags for Dynamo table"
  type        = "string"
}

variable "dynamo_name" {
  description = "Tags for Dynamo table"
  type        = "string"
}

variable "dynamo_tags" {
  description = "Tags for Dynamo table"
  type        = "string"
}

variable "region" {
  description = "AWS region"
  type        = "string"
}

variable "profile" {
  description = "AWS profile"
  type        = "string"
}
variable "owner" {
  description = "Owner Tag in tags"
  type        = "string"
}

variable "purpose" {
  description = "Purpose tag in tags"
  type        = "string"
}

variable "name" {
  description = "Name tag in tags"
  type        = "string"
}


