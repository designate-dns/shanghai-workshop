provider "openstack" {
  cloud   = "devstack"
}

resource "openstack_dns_zone_v2" "workshop_example_com" {
  name        = "workshop.example.com."
  email       = "jdoe@example.com"
  description = "An example zone"
  ttl         = 3000
  type        = "PRIMARY"
}

resource "openstack_dns_recordset_v2" "www_workshop_example_com" {
  zone_id     = "${openstack_dns_zone_v2.workshop_example_com.id}"
  name        = "www.workshop.example.com."
  description = "An example record set"
  ttl         = 3000
  type        = "A"
  records     = ["10.0.0.1"]
}