data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  fitler {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "newest_web_server" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    name = "Our favorite server."
  }

  subnet_id = "${aws_subnet.subnet2.id}"
}