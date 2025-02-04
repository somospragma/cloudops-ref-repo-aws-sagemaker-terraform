resource "aws_sagemaker_model" "model" {
  for_each           = local.resource_names
  name               = each.key
  execution_role_arn = aws_iam_role.sagemaker_execution_role[each.key].arn

  primary_container {
    image          = each.value.image
    model_data_url = each.value.model_data_url
    environment    = each.value.environment
  }

  vpc_config {
    subnets            = each.value.subnets
    security_group_ids = each.value.security_group_ids
  }
}

resource "aws_iam_role" "sagemaker_execution_role" {
  for_each = local.resource_names
  name = "${each.key}-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "sagemaker_policy_attachment" {
  for_each   = local.resource_names
  name       = "${each.key}-policy-attachment"
  roles      = [aws_iam_role.sagemaker_execution_role[each.key].name]
  policy_arn = each.value.policy_arn
}


