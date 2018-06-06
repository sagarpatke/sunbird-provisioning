/*
data "null_data_source" "computed" {
  inputs = {
    domain_name_tokens = "${join(".", slice(split(".", var.domain_name), length(split(".", var.domain_name)) - 2, length(split(".", var.domain_name))))}"
    hostname = "${join(".", slice(split(".", var.domain_name), 0, length(split(".", var.domain_name)) - 2))}"
  }
}

output "domain_name" {
  value = "${data.null_data_source.computed.outputs.domain_name_tokens}"
}

output "host_name" {
  value = "${data.null_data_source.computed.outputs.hostname}"
}

resource "godaddy_domain_record" "sunbird-domain" {
  domain = "${data.null_data_source.computed.outputs.domain_name_tokens}"

  record {
    name = "${data.null_data_source.computed.outputs.hostname}"
    type = "CNAME"
    data = "${data.aws_instance.sunbird-docker-master.0.public_dns}"
    ttl = 600
  }

  nameservers = ["ns49.domaincontrol.com", "ns50.domaincontrol.com"]
}

variable "domain_name" { }
*/