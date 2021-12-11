# Contain all the resources

################ vpc ################
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "np-terraform-vpc"
  }
}

################ public subnets ################
resource "aws_subnet" "publicSub1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public1_cidr
  availability_zone = var.public1_az
  tags = {
    Name = "np-terraform-subnetPublic1"
  }
}
resource "aws_subnet" "publicSub2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public2_cidr
  availability_zone = var.public2_az
  tags = {
    Name = "np-terraform-subnetPublic2"
  }
}
resource "aws_subnet" "publicSub3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public3_cidr
  availability_zone = var.public3_az
  tags = {
    Name = "np-terraform-subnetPublic3"
  }
}

################ private subnets ################
resource "aws_subnet" "privateSub1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private1_cidr
  availability_zone = var.private1_az
  tags = {
    Name = "np-terraform-subnetPrivate1"
  }
}
resource "aws_subnet" "privateSub2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private2_cidr
  availability_zone = var.private2_az
  tags = {
    Name = "np-terraform-subnetPrivate2"
  }
}
resource "aws_subnet" "privateSub3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private3_cidr
  availability_zone = var.private3_az
  tags = {
    Name = "np-terraform-subnetPrivate3"
  }
}

################ Internet Gateway ################
resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "np-terraform-InternetGateway"
  }
}

################ Nat Gateway ################
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.Igw]
  tags = {
    Name = "np-terraform-eip"
  }
}
resource "aws_nat_gateway" "Ngw" {
  connectivity_type = "public"
  allocation_id     = aws_eip.nat_eip.id
  subnet_id         = aws_subnet.publicSub1.id
  tags = {
    Name = "np-terraform-NatGateway"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.Igw]
}

################ Public Route table ################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Igw.id
  }
  tags = {
    Name = "np-terraform-publicRT"
  }
}
resource "aws_route_table_association" "publicSub1" {
  subnet_id      = aws_subnet.publicSub1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "publicSub2" {
  subnet_id      = aws_subnet.publicSub2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "publicSub3" {
  subnet_id      = aws_subnet.publicSub3.id
  route_table_id = aws_route_table.public.id
}

################ Private Route table ################
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Ngw.id
  }
  tags = {
    Name = "np-terraform-privateRT"
  }
}
resource "aws_route_table_association" "privateSub1" {
  subnet_id      = aws_subnet.privateSub1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "privateSub2" {
  subnet_id      = aws_subnet.privateSub2.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "privateSub3" {
  subnet_id      = aws_subnet.privateSub3.id
  route_table_id = aws_route_table.private.id
}
