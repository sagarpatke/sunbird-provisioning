/******************************************************************************
*********************************VPC Creation**********************************
******************************************************************************/
resource "aws_vpc" "sunbird" {
  cidr_block = "10.10.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    Name = "${var.implementation_name}"
  }
}

/******************************************************************************
****************************Creating Public Subnet*****************************
******************************************************************************/
resource "aws_subnet" "sunbird-public" {
  cidr_block = "10.10.2.0/24"
  vpc_id = "${aws_vpc.sunbird.id}"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.implementation_name}-public"
  }
}

/******************************************************************************
*************Route Table for Public Subnet, with Internet Gateway**************
******************************************************************************/
resource "aws_route_table" "sunbird-public"  {
  vpc_id = "${aws_vpc.sunbird.id}"

  tags {
    Name = "${var.implementation_name}-public"
  }
}

resource "aws_route_table_association" "sunbird-public" {
  subnet_id = "${aws_subnet.sunbird-public.id}"
  route_table_id = "${aws_route_table.sunbird-public.id}"
}

resource "aws_internet_gateway" "sunbird" {
  vpc_id = "${aws_vpc.sunbird.id}"

  tags {
    Name = "${var.implementation_name}"
  }
}

resource "aws_route" "sunbird-public" {
  route_table_id = "${aws_route_table.sunbird-public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.sunbird.id}"
}
