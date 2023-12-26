# public route table association

resource "aws_route_table_association" "prj2_pub_rt_ass" {

  subnet_id = aws_subnet.prj2_pub_sub.id

  route_table_id = aws_route_table.prj2_pub_rt.id

}

#private route table association

resource "aws_route_table_association" "prj2_pvt_rt_ass" {

  subnet_id = aws_subnet.prj2_pvt_sub.id

  route_table_id = aws_route_table.prj2_pvt_rt.id

}
