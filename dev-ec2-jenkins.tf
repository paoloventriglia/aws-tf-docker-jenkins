// Provision Dev bastion with Linux AWS AMI
resource "aws_instance" "jenkins" {
  ami           = "ami-9cbe9be5"
  instance_type = "t2.micro"
  key_name = "mykeypair"
  subnet_id = "${aws_subnet.dev-pub-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.dev-sec-group-public-subnet.id}"]

  tags {
    Name = "jenkins"
  }
}
