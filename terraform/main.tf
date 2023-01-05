module "yandex_dns_1" {
  source       = "./modules/dns_zone"
  network_name = "a"
}

module "yandex_instance_1" {
  source                = "./modules/create_vm"
  disk_size             = "30"
  cores                 = "2"
  memory                = "2"
  instance_family_image = "lemp"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "artifact-srv"
  instance_description  = "web server"
  zone_name             = "ru-central1-a"
}

module "yandex_instance_2" {
  source                = "./modules/create_vm"
  disk_size             = "40"
  cores                 = "2"
  memory                = "2"
  instance_family_image = "ubuntu-2204-lts"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "vc-srv"
  instance_description  = "verification center"
  zone_name             = "ru-central1-a"
}

module "yandex_instance_3" {
  source                = "./modules/create_vm"
  disk_size             = "80"
  cores                 = "2"
  memory                = "4"
  instance_family_image = "ubuntu-2204-lts"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "ts-srv"
  instance_description  = "user terminal server"
  zone_name             = "ru-central1-a"
}

module "yandex_dns_records_1" {
  source               = "./modules/dns_records"
  instance_name        = "artifact-srv"
  instance_internal_ip = data.yandex_compute_instance.vm01.network_interface.0.ip_address
}

module "yandex_dns_records_2" {
  source               = "./modules/dns_records"
  instance_name        = "vc-srv"
  instance_internal_ip = data.yandex_compute_instance.vm02.network_interface.0.ip_address
}

module "yandex_dns_records_3" {
  source               = "./modules/dns_records"
  instance_name        = "ts-srv"
  instance_internal_ip = data.yandex_compute_instance.vm03.network_interface.0.ip_address
}

data "yandex_compute_instance" "vm01" {
  name = "artifact-srv"
}

data "yandex_compute_instance" "vm02" {
  name = "vc-srv"
}

data "yandex_compute_instance" "vm03" {
  name = "ts-srv"
}

