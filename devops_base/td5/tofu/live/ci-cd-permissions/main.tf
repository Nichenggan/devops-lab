provider "aws" {
  region = "eu-central-1"
}

module "oidc_provider" {
  # source = "github.com/brikis98/devops-book//ch5/tofu/modules/github-aws-oidc"
  source = "../../modules/github-aws-oidc"

  provider_url = "https://token.actions.githubusercontent.com" 

}

module "iam_roles" {
  # source = "github.com/brikis98/devops-book//ch5/tofu/modules/gh-actions-iam-roles"
  source = "../../modules/gh-actions-iam-roles"

  name              = "lambda-sample"                           
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn    

  enable_iam_role_for_testing = true                            

  # TODO: fill in your own repo name here!
  github_repo      = "Nichenggan/devops-lab" 
  lambda_base_name = "lambda-sample"                            

  enable_iam_role_for_plan  = true                                
  enable_iam_role_for_apply = true                                

  # TODO: fill in your own bucket and table name here!
  tofu_state_bucket         = "my-open-tofu-bucket-chenyi" 
  tofu_state_dynamodb_table = "my-open-tofu-dynamodb-table-chenyi" 
}
