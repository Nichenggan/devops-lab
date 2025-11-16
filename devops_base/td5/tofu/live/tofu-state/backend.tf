terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "my-open-tofu-bucket-chenyi-cd" 
    key            = "tp5/tofu/live/tofu-state"          
    region         = "eu-central-1"                         
    encrypt        = true                                
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "my-open-tofu-bucket-chenyi-cd" 
  }
}