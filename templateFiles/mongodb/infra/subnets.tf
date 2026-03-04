data "aws_internet_gateway" "main" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_subnet" "main" {
  vpc_id            = var.vpc_id
  cidr_block        = local.block_cidr
  availability_zone = local.availability_zone

  tags = {
    Name = "${var.name}-mongodb-${substr(local.availability_zone, -2, 2)}-${var.environment}"
  }
}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
}

resource "aws_route" "main" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.aws_internet_gateway.main.id
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}
