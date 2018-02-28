variable "is_ready" {
  description = "Is the null_resource ready"
  type        = "string"
}

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


