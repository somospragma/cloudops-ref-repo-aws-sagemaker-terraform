locals {
  resource_names = {
    for model in var.models : "${var.client}-${var.project}-${var.environment}-${var.application}-${model.function}-${model.index}" => model
  }

}
