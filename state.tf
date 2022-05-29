terraform {
   backend "s3" {
     bucket = "k8s-hardway-iaac-state"
     key = "terraform.tfstate"
     region = "eu-west-1"
   }
}