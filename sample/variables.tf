variable "client" {
  type = string
}
variable "environment" {
  type = string
}
variable "aws_region" {
  type = string
}
variable "profile" {
  type = string
}
variable "common_tags" {
    type = map(string)
    description = "Tags comunes aplicadas a los recursos"
}
variable "project" {
  type = string  
}
variable "functionality" {
  type = string  
}
variable "functionality2" {
  type = string  
}
variable "application" {
  type = string  
}



########### Varibales sagemaker





