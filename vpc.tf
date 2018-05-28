
/******************************************************************************
****************************Provider Configuration*****************************
******************************************************************************/
provider "aws" {
  profile = "jaldhara"
  region = "ap-south-1"
}


/******************************************************************************
*********************************VPC Creation**********************************
******************************************************************************/
resource "aws_vpc" "jaldhara" {
  cidr_block = "10.10.0.0/16"
  enable_dns_hostnames = "true"

  tags {
    Name = "jaldhara"
  }
}


/******************************************************************************
****************************Creating Private Subnet****************************
******************************************************************************/
resource "aws_subnet" "jaldhara-private" {
  cidr_block = "10.10.1.0/24"
  vpc_id = "${aws_vpc.jaldhara.id}"

  tags {
    Name = "jaldhara-public"
  }
}

/******************************************************************************
****************************Creating Public Subnet*****************************
******************************************************************************/
resource "aws_subnet" "jaldhara-public" {
  cidr_block = "10.10.2.0/24"
  vpc_id = "${aws_vpc.jaldhara.id}"

  tags {
    Name = "jaldhara-private"
  }
}

/******************************************************************************
***************Route Table for Private Subnet, with NAT Gateway****************
******************************************************************************/
resource "aws_route_table" "jaldhara-private"  {
  vpc_id = "${aws_vpc.jaldhara.id}"

  tags {
    Name = "jaldhara-private"
  }
}

resource "aws_route_table_association" "jaldhara-private" {
  subnet_id = "${aws_subnet.jaldhara-private.id}"
  route_table_id = "${aws_route_table.jaldhara-private.id}"
}

resource "aws_route" "jaldhara-private" {
  route_table_id = "${aws_route_table.jaldhara-private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.jaldhara-public.id}"
}

resource "aws_nat_gateway" "jaldhara-public" {
  subnet_id = "${aws_subnet.jaldhara-private.id}"
  allocation_id = "${aws_eip.jaldhara-nat-eip.id}"

  tags {
    Name = "jaldhara-private"
  }
}

resource "aws_eip" "jaldhara-nat-eip" {
  tags {
    Name = "jaldhara-nat-eip"
  }
}

/******************************************************************************
*************Route Table for Public Subnet, with Internet Gateway**************
******************************************************************************/
resource "aws_route_table" "jaldhara-public"  {
  vpc_id = "${aws_vpc.jaldhara.id}"

  tags {
    Name = "jaldhara-public"
  }
}

resource "aws_route_table_association" "jaldhara-public" {
  subnet_id = "${aws_subnet.jaldhara-public.id}"
  route_table_id = "${aws_route_table.jaldhara-public.id}"
}

resource "aws_internet_gateway" "jaldhara" {
  vpc_id = "${aws_vpc.jaldhara.id}"

  tags {
    Name = "jaldhara"
  }
}

resource "aws_route" "jaldhara-public" {
  route_table_id = "${aws_route_table.jaldhara-public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.jaldhara.id}"
}
