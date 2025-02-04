data "aws_caller_identity" "current" {}


data "aws_ecr_image" "model" {
  repository_name = "pragma-hefesto-dev-sagemaker-test"
  image_tag       = "latest" 
}

data "aws_s3_object" "model" {
  bucket = "pragma-hefesto-dev-sagemaker-test"
  key    = "model.tar.gz"
}

data "aws_subnet" "private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["${var.client}-${var.project}-${var.environment}-subnet-private-subnet-1"] 
  }
}

data "aws_security_groups" "model" {
  filter {
    name   = "tag:NombreDelTag"
    values = ["${var.client}-${var.project}-${var.environment}-${var.application}"]
  }
}