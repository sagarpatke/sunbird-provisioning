resource "aws_instance" "sunbird-db" {
  instance_type = "t2.micro"
  ami = "${data.aws_ami.ubuntu.id}"
  key_name = "${aws_key_pair.sunbird.key_name}"
  security_groups = ["${aws_security_group.sunbird-private.id}"]
  subnet_id = "${aws_subnet.sunbird-public.id}"

  root_block_device {
    volume_size = 20
  }

  tags {
    Name = "${var.implementation_name}-db"
  }
}
