variable "environment" {
  description = "The environment in which the VM is deployed"
  type = string
}

variable "zone" {
  description = "The zone to which VM is connected"
  type = string
}

variable "disk_size" {
  description = "The size of disk in GB"
  type = string
}

variable "vm_name" {
  description = "The ame of VM"
  type = string
}