terraform {
backend "s3" {
bucket = "my-open-tofu-bucket-chenyi-cd" # Same bucket as above
key = "td5/tofu/live/lambda-sample" # Unique key
region = "eu-central-1" # Your AWS region
encrypt = true
dynamodb_table = "my-open-tofu-bucket-chenyi-cd" # Same table as above
}
}