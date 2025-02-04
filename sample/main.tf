module "sagemaker_models" {
  source = "./module/sagemaker"

  client      = var.client
  project     = var.project
  environment = var.environment
  application = var.application
  models = [
    {
      function           = var.functionality
      index              = 1  #numero en secuencia segun la cantidad
      image              = data.aws_ecr_image.model.image_uri
      model_data_url     = "s3://${data.aws_s3_object.model.id}"
      policy_arn         = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
      environment        = { SAGEMAKER_PROGRAM = "inference.py" }  #varibales de entorno opcionales
      subnets            = [data.aws_subnet.private_subnet_1.id]
      #security_group_ids = [data.aws_security_groups.model.ids]  #para multiples poner entre corchete cuadrado
      security_group_ids = data.aws_security_groups.model.ids

    },
    {
      function           = var.functionality2
      index              = 2 #numero en secuencia segun la cantidad
      image              = data.aws_ecr_image.model.image_uri
      model_data_url     = "s3://${data.aws_s3_object.model.id}"
      policy_arn         = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
      environment        = { SAGEMAKER_PROGRAM = "inference.py" }  #variables de entorno opcionales
      subnets            = [data.aws_subnet.private_subnet_1.id]
      security_group_ids = data.aws_security_groups.model.ids
    }
  ]
}
