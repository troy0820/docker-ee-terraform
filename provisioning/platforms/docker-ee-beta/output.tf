output "user_data" {
  value = "${module.docker-ee-beta.user_data}"
}

output "ssh_ip_address" {
  value = "${module.docker-ee-beta.ssh_ip_address}"
}

output "is_complete" {
  value = "${module.docker-ee-beta.is_complete}"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}
