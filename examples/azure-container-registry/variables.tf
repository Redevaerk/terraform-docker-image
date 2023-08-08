variable "name" {
  description = "A unique name for your Image"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group to deploy platform. This Resource should be already created"
  type        = string
}

variable "location" {
  description = "Region to deploy the resources"
  type        = string
  default     = "westeurope"
}
