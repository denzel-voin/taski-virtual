terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.181.0"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

module "vm" {
  source = "../../modules/vm"

  environment = "prod"
  disk_size = "20"
  zone = var.zone
  vm_name = "prod-vm"
}