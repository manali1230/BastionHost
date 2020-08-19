resource "aws_eip" "elasticip" {
  vpc      = true
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.subnet1.id
  tags = {
    Name = "mynatgateway"
  }
}
resource "aws_route_table" "ngroute" {
  vpc_id = aws_vpc.main.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }
   tags = {
    Name = "routetableforng"
  }
}
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.ngroute.id
}