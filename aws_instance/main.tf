#key pair
resource "aws_key_pair" "ec2-key" {
  key_name   = "webserver-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCL8aaQYn3cvh3T3LsSS97eYvB1HZ/MUXvhzCTj0o5pTBlv0nwjj0J5K4zkWKyUiuO+kse+0LGo2sZswhScPBf8wnJ95JnfttpRJUgvAPs72eIdAG0WD+fhgBIwBHxzLjdrx01kXmjM7N4CxUce9D7v+4JzEeaIQrzGeMS5WQ3U+Xx3z04rt2oRw2I9BgvoX5xNy2bXaAh7DUh4LTIWkbBOmSEw7zn3xQ8d4ac0QRcA55FPH9/zGGvDzBm4rFl2QtG2njLRW6LCTG4N5x90nc8oBGuU8REOwlNtqFJdkOCZozPLS8XCgvQWb3hOqdOnw2buZtybwdon/PWVdhJJbfNo2jazPvfOTWpdNcQBOKd3nzsqI/zCNcThfDQZKkeozq2Gpa9ZEx9ZI1obnVbwQKDEAWA3jEnqoe/mj65dI69FNeLlMBJ49rxv+qqctTWrUM9QceEYOjeu5+cFMVuRfnW/8jA2hUat9HM7ASsXsCrBn4GIHdDYn7Qp8+UQof6gpoI1sVgDaU2ILTlAZaTl4ffHnQSNUsRFj2p3IGyfcrGnuZG1SLdM04+CA0HW2/o2y+RUkddWc6ixvXMsfcemMNj2IS6Tn1/VgizS7I7lCnrxsq4dNJkqfFu2L45+f5bpWqKsP1uFdtCufi4xU4Quba6TlqhEkxMZzaVOKcj2p9p2w== Dell@DESKTOP-QC1BA12"
}

#security groups
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0e3870645575e4db1"

  tags = {
    Name = "web-server-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
#Ec2 instance
resource "aws_instance" "example" {
  ami             = var.ami 
  instance_type   = var.instance_type  #"t2.micro"
  key_name        = aws_key_pair.ec2-key
  vpc_security_group_ids = ["aws_security_group.allow_tls.name"]

  tags = {
    Environment = "Dev"
    Appname     = "wiergallery"
  }
}






