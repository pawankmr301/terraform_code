resource "aws_security_group" "default" {
    name = "${var.sg-name}"
    vpc_id = "${var.vpc-id}"

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks =["0.0.0.0/0"]
    }

        tags {
        Name = "amway-${var.sg-name}"
        Environment = "${var.environment}"
        }
}