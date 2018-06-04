/******************************************************************************
*******************Creating Launch Configuration for Docker********************
******************************************************************************/
resource "aws_launch_configuration" "sunbird-docker-master" {
  name = "${var.implementation_name}-docker-master"
  key_name = "${aws_key_pair.sunbird.key_name}"
  image_id = "${data.aws_ami.ubuntu.id}"
  security_groups = ["${aws_security_group.sunbird-private.id}"]
  instance_type = "${var.app_instance_type}"
  root_block_device {
    volume_size = 20
  }
}
