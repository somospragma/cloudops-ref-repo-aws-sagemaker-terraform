variable "models" {
  description = "Lista de configuraciones para cada modelo de SageMaker"
  type = list(object({
    function           = string
    index              = number
    image              = string
    model_data_url     = string
    policy_arn         = string 
    environment        = optional(map(string), {})
    subnets            = list(string)
    security_group_ids = list(string)
  }))
}


variable "client" {
  description = "Nombre del cliente"
  type        = string
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (por ejemplo, dev, qa, prod)"
  type        = string
}

variable "application" {
  description = "Nombre de la aplicación"
  type        = string
}

