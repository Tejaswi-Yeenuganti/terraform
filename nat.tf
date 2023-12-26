#CREATING_ELASTIC_IP

resource "aws_eip" "prj2_eip" {
  instance = "" ##we can keep it empty as of now if we dont want to associate it

}


#creating nat gateway

resource "aws_nat_gateway" "prj2_nat" {

  allocation_id = aws_eip.prj2_eip.id

  subnet_id = aws_subnet.prj2_pub_sub.id
}


#attaching private route table to nat gateway

resource "aws_route" "nat_internet_gateway" {
  route_table_id         = aws_route_table.prj2_pvt_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.prj2_nat.id

}
