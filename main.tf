resource "yandex_compute_instance" "vm-1" {
  name = "cp"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
      type = "network-ssd"
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
  name = "node-1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
      type = "network-ssd"
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
  name = "node-2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
      type = "network-ssd"
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
  name = "node-3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p6amfv1d4ehbfjjrl"
      type = "network-ssd"
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
