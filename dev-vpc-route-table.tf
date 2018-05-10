// Create route for Dev public subnet
resource "aws_route_table" "dev-pub-route" {
  vpc_id = "${aws_vpc.dev-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.dev-igw.id}"
  }

  tags {
    Name = "dev-pub-route"
  }
}


# Associate Dev public subnet route with Dev public subnet
resource "aws_route_table_association" "dev-sub-route-pub-ass" {
  subnet_id = "${aws_subnet.dev-pub-subnet.id}"
  route_table_id = "${aws_route_table.dev-pub-route.id}"
}