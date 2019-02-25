resource "aws_vpc" default {
    cidr_block = "${var.vpc-cidr}"

        tags {
        Name = "amway-${var.vpc-name}"
        Environment = "${var.environment}"
        }
}
