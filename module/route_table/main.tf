# VPC Resources

data "aws_availability_zones" "available_vpc" {}

locals {
  network_count = "${length(data.aws_availability_zones.available_vpc.names)}"
}

resource "aws_route_table" "default" {
  vpc_id = "${var.vpc-id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.inte_gate_id}"
  }

    tags {
        Name = "amway-${var.rt-name}"
        Environment = "${var.environment}"
    }
}

resource "aws_route_table_association" "default" {
#  #count         = "${length(data.aws_availability_zones.available_vpc.names)}"
  count          = "${local.network_count}"
  subnet_id      = "${var.public-subnet-id}"
  route_table_id = "${aws_route_table.default.id}"
}

resource "aws_main_route_table_association" "default" {
  vpc_id = "${var.vpc-id}"
  route_table_id = "${aws_route_table.default.id}"
}