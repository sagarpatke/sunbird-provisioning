data "aws_instance" "sunbird-docker-master" {
  filter {
    name = "tag:aws:autoscaling:groupName"
    values = ["${var.implementation_name}-docker-master"]
  }

  depends_on = ["aws_autoscaling_group.sunbird-docker-master"]
}

output "docker-master" {
  value = "${data.aws_instance.sunbird-docker-master.0.public_dns}"
}

output "sunbird-db" {
  value = "${aws_instance.sunbird-db.public_dns}"
}
