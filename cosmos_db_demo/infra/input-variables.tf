variable "resource_group_name" {
  default = "rg-cosmos-demo-tf"
  type    = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "swedencentral"
}
