// Create security group to allow traffic inbound and outbound tp/from public subnet
resource "aws_security_group" "dev-sec-group-public-subnet" {
  name = "dev-sec-group-public-subnet"
  description = "Allow inbound traffic to public subnet"
  vpc_id = "${aws_vpc.dev-vpc.id}"

// Allow inbound ssh access from internet
  ingress {
    from_port = 22
    to_port = 22
    protocol = "6"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  // Allow outbound http access to internet
  egress {
    from_port = 80
    to_port = 80
    protocol = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

// Allow outbound https access to internet
  egress {
    from_port = 443
    to_port = 443
    protocol = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "dev-sec-group-public-subnet"
  }
}