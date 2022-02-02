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
