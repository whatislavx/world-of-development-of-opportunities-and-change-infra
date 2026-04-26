locals {
  security_group_ingress_rules = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.allowed_ssh_cidr]
    },
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  security_group_egress_rules = [
    {
      description = "Allow HTTP outbound"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS outbound"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow DNS outbound"
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow RDS access"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.20.0.0/16"]
    }
  ]
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu_24_04.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  key_name             = aws_key_pair.this.key_name
  iam_instance_profile = var.iam_instance_profile

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    users                   = var.ec2_users
    passwordless_sudo_users = var.passwordless_sudo_users
    ssh_public_key          = trimspace(file(var.public_key_path))
  })
  user_data_replace_on_change = true

  associate_public_ip_address = true

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}

resource "aws_eip" "app" {
  count    = var.allocate_eip ? 1 : 0
  instance = aws_instance.app.id
  domain   = "vpc"

  tags = {
    Name        = "${var.instance_name}-eip"
    Environment = var.environment
  }
}

data "aws_ami" "ubuntu_24_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

#trivy:ignore:AVD-AWS-0104
resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.security_group_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.security_group_egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

