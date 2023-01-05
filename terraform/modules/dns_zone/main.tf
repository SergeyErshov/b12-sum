resource "yandex_dns_zone" "myzone" {
  name        = "b12"
  description = "local zone for task B12"
  zone        = "sf.local."
  public           = false
  private_networks = [data.yandex_vpc_network.net.id]
}

#Получаем id подсети для зоны
data "yandex_vpc_network" "net" {
  name = var.network_name
}


