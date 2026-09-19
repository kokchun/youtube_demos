variable "admin_username" {
  description = "admin username for windows vm"
  type        = string
  sensitive   = true
}


variable "admin_password" {
  description = "admin password for windows vm"
  type        = string
  sensitive   = true
}

variable "my_ip" {
  description = "public ip address for RDP"
  type        = string
}
