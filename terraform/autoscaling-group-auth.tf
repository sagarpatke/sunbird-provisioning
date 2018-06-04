resource "aws_autoscaling_group" "sunbird-auth" {
  name = "${var.implementation_name}-auth"
  launch_configuration = "${aws_launch_configuration.sunbird-auth.id}"
  vpc_zone_identifier = ["${aws_subnet.sunbird-public.id}"]
  desired_capacity = 1
  min_size = 0
  max_size = 1
}
