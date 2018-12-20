resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name = "arjun-rt"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table" "rtp" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name = "arjun-rtp"
  }
}

resource "aws_route_table_association" "rtap" {
  subnet_id = "${aws_subnet.private-subnet.id}"
  route_table_id = "${aws_route_table.rtp.id}"
}

