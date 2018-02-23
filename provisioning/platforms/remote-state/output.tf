output "s3_bucket_id" {
  value = "${module.aws-remote-state.s3_bucket_id}"
}

output "s3_bucket_arn" {
  value = "${module.aws-remote-state.s3_bucket_arn}"
}

output "dynamo_table_id" {
  value = "${module.aws-remote-state.dynamo_table_id}"
}

output "dynamo_table_arn" {
  value = "${module.aws-remote-state.dynamo_table_arn}"
}

output "is_complete" {
  value = "${module.aws-remote-state.is_complete}"
}
