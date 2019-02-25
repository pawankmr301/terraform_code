resource "aws_instance" "default" {
    ami = "ami-0ad42f4f66f6c1cc9"
    subnet_id = "${var.public-sid}"
    security_groups = ["${var.sg-id}"]
    instance_type = "${var.instance-type}"
    associate_public_ip_address = true
    key_name = "${var.key-name}"

        tags {
        Name = "amway-${var.ec2-name}"
        Environment = "${var.environment}"
        }
}
