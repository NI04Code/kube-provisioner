variable "key_name" {
  description = "The name of the SSH key pair to log on to instances"
  type        = string
}

variable "worker_node_amount" {
  description = "The number of worker nodes to provision"
  type        = number
  default     = 2
}