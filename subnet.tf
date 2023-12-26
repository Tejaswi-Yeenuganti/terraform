#public_subnet

resource "aws_subnet" "prj2_pub_sub" {
  vpc_id                  = aws_vpc.prj2_terraform.id
  cidr_block              = "10.0.0.0/28"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = "true"

  tags = {

    Name = "PRJ2_SUBNET_PUB_SB"

  }
}


#private_subnet

resource "aws_subnet" "prj2_pvt_sub" {
  vpc_id                  = aws_vpc.prj2_terraform.id
  cidr_block              = "10.0.0.16/28"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = "false"

  tags = {

    Name = "PRJ2_SUBNET_PVT_SB"


  }
}
