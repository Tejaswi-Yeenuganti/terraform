###WEB_SERVER_INSTANCE######

resource "aws_instance" "prj2_web_instance" {
  ami                    = "ami-0ee4f2271a4df2d7d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.prj2_pub_sub.id
  key_name               = "prj2"
  count                  = 1
  vpc_security_group_ids = [aws_security_group.http-ssh.id]
  user_data              = file("ecomm.sh")
}


###RDS_SERVER_INSTANCE######

resource "aws_instance" "prj2_rds_instance" {
  ami                    = "ami-0ee4f2271a4df2d7d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.prj2_pvt_sub.id
  key_name               = "prj2"
  count                  = 1
  vpc_security_group_ids = [aws_security_group.prj2_rds.id]

}
