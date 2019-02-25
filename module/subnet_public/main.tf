resource "aws_subnet" "default" {
    cidr_block = "${var.public-subnet-cidr}"
    vpc_id = "${var.vpc-id}"
    availability_zone ="${var.public-availability-zone}"
    map_public_ip_on_launch  = true

        tags {
        Name = "amway-${var.public-subnet-name}"
        Environment = "${var.environment}"
        }
}