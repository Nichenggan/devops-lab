provider "aws" {
  region = "eu-central-1"
}
#new test comment
module "function" {
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/lambda"

  name = var.name      

  src_dir = "${path.module}/src" 
  runtime = "nodejs20.x"         
  handler = "index.handler"      

  memory_size = 128              
  timeout     = 5                

  environment_variables = {      
    NODE_ENV = "production"
  }
}

resource "aws_lambda_function_url" "default" {
  function_name      = module.function.function_name
  authorization_type = "NONE"
}

output "api_endpoint" {
  description = "The URL of the Lambda function (for validation tests)"
  value       = aws_lambda_function_url.default.function_url

}
