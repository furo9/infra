data "aws_ami" "bitnami_mongodb" {
  most_recent = true
  owners      = ["979382823631"]

  filter {
    name   = "name"
    values = ["bitnami-mongodb-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "main" {
  ami                         = data.aws_ami.bitnami_mongodb.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true

  key_name = aws_key_pair.main.key_name

  root_block_device {
    volume_type = "gp3"
    volume_size = var.storage
  }
}

resource "aws_key_pair" "main" {
  public_key = file(var.ssh_public_key_path)
}

resource "aws_security_group" "main" {
  vpc_id = aws_subnet.main.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
