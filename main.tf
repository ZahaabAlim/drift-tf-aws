provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "tf-state-bucket0210"
    key    = "terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "TfStatelock"
  }
}
 
resource "aws_s3_bucket" "bucket1" {
  bucket = "za-test-buck-1"
}
 
resource "aws_s3_bucket" "bucket2" {
  bucket = "za-test-buck-2"
}
 
resource "aws_dynamodb_table" "my_table" {
  name         = "my_test_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
 
  attribute {
    name = "id"
    type = "S"
  }
}
resource "aws_ecr_repository" "my_repo" {
  name = "test-ecr-repo"
}