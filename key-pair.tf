resource "aws_key_pair" "sunbird" {
  key_name = "${var.implementation_name}"
  public_key = "${var.public_key}"
}
