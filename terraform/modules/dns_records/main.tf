resource "yandex_dns_recordset" "set_dns" {
  zone_id = data.yandex_dns_zone.myzone.id
  name    = "${var.instance_name}.sf.local."
  type    = "A"
  ttl     = 3600
  data    = [var.instance_internal_ip]
}

data "yandex_dns_zone" "myzone" {
  name = "b12"
}

