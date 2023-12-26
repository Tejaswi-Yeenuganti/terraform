#Internet gateway

resource "aws_internet_gateway" "prj2_igw" {

  vpc_id = aws_vpc.prj2_terraform.id

  tags = {

    Name = "PRJ2_IGW"

  }
}
