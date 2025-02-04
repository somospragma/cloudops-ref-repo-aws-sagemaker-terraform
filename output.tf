output "sagemaker_model_arns" {
  value = { for key, model in aws_sagemaker_model.model : key => model.arn }
  description = "ARNs de los modelos de SageMaker creados"
}

output "sagemaker_execution_role_arns" {
  value = { for key, role in aws_iam_role.sagemaker_execution_role : key => role.arn }
  description = "ARNs de los roles de ejecución de SageMaker asociados"
}

output "sagemaker_model_names" {
  value = { for key, model in aws_sagemaker_model.model : key => model.name }
  description = "Nombres de los modelos de SageMaker creados"
}
