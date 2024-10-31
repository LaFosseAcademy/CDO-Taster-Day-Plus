resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = ""
  tags = {
    name = "http_server_sg"
  }
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 
  to_port           = 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_server_sg.id
}


resource "aws_security_group_rule" "ssh_ingres" {
  type              = "ingress"
  from_port         = 
  to_port           = 
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_server_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         =
  to_port           =
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.http_server_sg.id
}