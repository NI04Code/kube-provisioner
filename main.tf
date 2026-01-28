resource "aws_security_group" "kube-sg" {
  name        = "kube-sg"
  description = "SG for Kubernetes Cluster"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

// Kubernetes related rule
  ingress {
    description      = "Kubernetes API Server"
    from_port        = 6443
    to_port          = 6443
    protocol         = "tcp"
    self             = true
  }

  ingress {
    description      = "etcd server client API"
    from_port        = 2379
    to_port          = 2380
    protocol         = "tcp"
    self             = true
  }

  ingress {
    description      = "Kubelet, Scheduler, Controller Manager"
    from_port        = 10250
    to_port          = 10252
    protocol         = "tcp"
    self             = true
  }

  ingress {
    description      = "Metric Server"
    from_port        = 4443
    to_port          = 4443
    protocol         = "tcp"
    self             = true
  }

  ingress {
    description      = "NodePort"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    self             = true
  }

  ingress {
    description      = "Calico VXLAN"
    from_port        = 0
    to_port          = 65535
    protocol         = "udp"
    self             = true
  }

  ingress {
    description      = "Typha"
    from_port        = 5473
    to_port          = 5473
    protocol         = "tcp"
    self             = true
  }

  tags = {
    Name = "kube-sg"
  }
}