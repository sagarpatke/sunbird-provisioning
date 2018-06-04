/******************************************************************************
*******************Creating Launch Configuration for Docker********************
******************************************************************************/
resource "aws_launch_configuration" "sunbird-auth" {
  name = "${var.implementation_name}-auth"
  key_name = "${aws_key_pair.sunbird.key_name}"
  image_id = "${data.aws_ami.ubuntu.id}"
  security_groups = ["${aws_security_group.sunbird-private.id}"]
  instance_type = "${var.auth_instance_type}"
  root_block_device {
    volume_size = 20
  }
}
