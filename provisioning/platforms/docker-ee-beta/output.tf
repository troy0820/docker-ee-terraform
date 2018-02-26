output "user_data" {
  value = "${module.docker-ee-beta.user_data}"
}

output "ssh_ip_address" {
  value = "${module.docker-ee-beta.ssh_ip_address}"
}

output "is_complete" {
  value = "${module.docker-ee-beta.is_complete}"
}
