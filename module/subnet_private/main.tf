resource "aws_subnet" "default" {
    cidr_block = "${var.private-subnet-cidr}"
    vpc_id = "${var.vpc-id}"
    availability_zone ="${var.private-availability-zone}"
    map_public_ip_on_launch = false

        tags {
        Name = "amway-${var.private-subnet-name}"
        Environment = "${var.environment}"
        }
}