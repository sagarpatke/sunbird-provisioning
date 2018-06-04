resource "aws_instance" "sunbird-db" {
  instance_type = "${var.db_instance_type}"
  ami = "${data.aws_ami.ubuntu.id}"
  key_name = "${aws_key_pair.sunbird.key_name}"

  /* Using security_groups instead of vpc_security_group_ids forces a new instance everytime. */
  vpc_security_group_ids = ["${aws_security_group.sunbird-private.id}"]
  subnet_id = "${aws_subnet.sunbird-public.id}"

  root_block_device {
    volume_size = 20
  }

  tags {
    Name = "${var.implementation_name}-db"
  }
}
