terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = "AQAAAAAmbWxPAATuwUWrKtq93kOIpMgIxdcgk3Y"
  cloud_id  = "b1gb95t5k7ogndpha4ef"
  folder_id = "b1gf0uge2c4qe3upqfo7"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
  name = "instance-1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet1.id}"
    nat       = true
  }

  metadata = {
    user-data = "${file("~/yandex-cloud-terraform/meta.txt")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "instance-2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet1.id}"
    nat       = true
  }

  metadata = {
    user-data = "${file("~/yandex-cloud-terraform/meta.txt")}"
  }
}

resource "yandex_compute_instance" "vm-3" {
  name = "instance-3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet1.id}"
    nat       = true
  }

  metadata = {
    user-data = "${file("~/yandex-cloud-terraform/meta.txt")}"
  }
}

resource "yandex_compute_instance" "vm-4" {
  name = "instance-4"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet1.id}"
    nat       = true
  }

  metadata = {
    user-data = "${file("~/yandex-cloud-terraform/meta.txt")}"
  }
}

resource "yandex_vpc_network" "default" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet1" {
  name = "subnet-1"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["10.131.0.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}
output "internal_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.ip_address
}

output "internal_ip_address_vm_4" {
  value = yandex_compute_instance.vm-4.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}
output "external_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_4" {
  value = yandex_compute_instance.vm-4.network_interface.0.nat_ip_address
}

