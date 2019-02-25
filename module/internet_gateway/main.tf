resource "aws_internet_gateway" "default" {
    vpc_id = "${var.vpc-id}"

        tags {
        Name = "amway-${var.internet-gateway}"
        Environment = "${var.environment}"
        }
}

