module "vpc" {
  source = "../module/vpc"
  vpc-name = "vpc"
  vpc-cidr = "10.0.0.0/16"
  environment = "Development"
}
module "public_subnet" {
  source = "../module/subnet_public"
  public-subnet-cidr = "10.0.10.0/24"
  public-subnet-name = "public-subnet"
  public-availability-zone = "ap-south-1a"
  environment = "Development"
  vpc-id = "${module.vpc.vpc_id}"
}

module "private_subnet" {
  source = "../module/subnet_private"
  private-subnet-cidr = "10.0.20.0/24"
  private-subnet-name = "private-subnet"
  private-availability-zone = "ap-south-1b"
  environment = "Development"
  vpc-id = "${module.vpc.vpc_id}"
}

module "internet_gateway" {
  source = "../module/internet_gateway"
  vpc-id = "${module.vpc.vpc_id}"
  environment = "Development"
  internet-gateway = "igw"
}

module "route_table" {
  source = "../module/route_table"
  inte_gate_id = "${module.internet_gateway.igw_id}"
  vpc-id = "${module.vpc.vpc_id}"
  public-subnet-id = "${module.public_subnet.pub_subnet_id}"
  rt-name = "public-rt"
  environment = "Development"
}

module "security_group" {
  source = "../module/security_group"
  vpc-id = "${module.vpc.vpc_id}"
  sg-name = "security-group"
  environment = "Development"
}

module "ec2_machine" {
  source = "../module/ec2_machine"
  vpc-id = "${module.vpc.vpc_id}"
  sg-id = "${module.security_group.sg_id}"
  public-sid = "${module.public_subnet.pub_subnet_id}"
  public-availability-zone = "ap-south-1a"
  key-name = "mumbai-kubernetes-key"
  environment = "Development"
  instance-type = "t2.micro"
  ec2-name = "rancher"
}
