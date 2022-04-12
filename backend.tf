provider "google" {
  credentials = file("terraform.json")
  project     = "future-union-346116"
  region      = "us-west1"
  zone        = "us-west1-a"
}

#terraform {
#  backend "gcs" {
#    bucket  = "bucketforterraform"
#    prefix  = "bucketforterraform/terraform.tfstate"
#  }
#}