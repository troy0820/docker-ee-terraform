variable "is_ready" {
  description = "When populated the module will be started."
  type        = "string"
}

variable "key_name" {
  description = "ssh key_name pair for instance connection"
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

variable "ami" {
  description = "Name of ami to use"
  type        = "string"
}

variable "count" {
  description = "The count of instances for docker-ee-beta"
  type        = "string"
}

variable "instance_type" {
  description = "Instance size of node"
  type        = "string"
  default     = "t2.medium"
}

variable "docker_key" {
  description = "Docker EE key"
  type        = "string"
}

variable "cidr_block" {
  description = "CIDR block for subnet"
  type        = "string"
}
