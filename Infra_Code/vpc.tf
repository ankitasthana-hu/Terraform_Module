resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  id = "${var.vpc_id}"
  
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = "${aws_subnet.my_subnet.id}"
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "P1_Interface"
  }
}