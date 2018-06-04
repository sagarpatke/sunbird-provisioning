data "aws_instance" "sunbird-docker-master" {
  filter {
    name = "tag:aws:autoscaling:groupName"
    values = ["${var.implementation_name}-docker-master"]
  }

  depends_on = ["aws_autoscaling_group.sunbird-docker-master"]
}

data "aws_instance" "sunbird-auth" {
  filter {
    name = "tag:aws:autoscaling:groupName"
    values = ["${var.implementation_name}-auth"]
  }

  depends_on = ["aws_autoscaling_group.sunbird-auth"]
}

data "azurerm_storage_account" "sunbird-storage" {
  name = "${azurerm_storage_account.sunbird.name}"
  resource_group_name = "${azurerm_resource_group.sunbird.name}"
}

output "sunbird_master_host_private_ip" {
  value = "${data.aws_instance.sunbird-docker-master.0.private_ip}"
}

output "sunbird_master_host_public_dns" {
  value = "${data.aws_instance.sunbird-docker-master.0.public_dns}"
}

output "sunbird_db_host_private_ip" {
  value = "${aws_instance.sunbird-db.private_ip}"
}

output "sunbird_db_host_public_dns" {
  value = "${aws_instance.sunbird-db.public_dns}"
}

output "sunbird_auth_host_private_ip" {
  value = "${data.aws_instance.sunbird-auth.0.private_ip}"
}

output "sunbird_auth_host_public_dns" {
  value = "${data.aws_instance.sunbird-auth.0.public_dns}"
}

output "azure_storage_account_name" {
  value = "${azurerm_storage_account.sunbird.name}"
}

output "azure_storage_account_url" {
  value = "${data.azurerm_storage_account.sunbird-storage.primary_blob_endpoint}"
}

output "azure_storage_account_key" {
  value = "${data.azurerm_storage_account.sunbird-storage.primary_access_key}"
}