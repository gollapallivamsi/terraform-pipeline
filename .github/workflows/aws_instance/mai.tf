resource "aws_instance" "example" {
  ami             = var.ami #"ami-0c02fb55956c7d316"
  instance_type   = var.instance_type  #"t2.micro"
  key_name        = var.key_name  #"your-keypair-name"
  security_groups = var.security_groups #[aws_security_group.ec2_sg.name]

  tags = {
    Environment = "Dev"
    Appname     = "wiergallery"
  }
}
