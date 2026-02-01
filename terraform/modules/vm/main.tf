terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.181.0"
    }
  }
}

resource "yandex_compute_disk" "boot_disk" {
  name = "${var.vm_name}-disk"
  size = var.disk_size
  zone = var.zone

  labels = {
    environment = var.environment
  }
}

resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.foo.id
}

resource "yandex_compute_instance" "vm" {
  name = var.vm_name
  zone = var.zone
  allow_stopping_for_update = true

  boot_disk {
    device_name = "boot"
    disk_id = yandex_compute_disk.boot_disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.foo.id
    nat       = true
  }

  resources {
    cores = 2
    memory = 2
  }
}