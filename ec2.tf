resource "aws_instance" "myec2" {
  ami                    = "ami-05ba3a39a75be1ec4"
  instance_type          = "t2.micro"
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = "MyNewKey"

  tags = {
    name = "testec2"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.public_ip} >> /etc/ansible/hosts"
  }
}
