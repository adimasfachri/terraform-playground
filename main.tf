provider "aws" {

    region = "ap-southeast-1"
    access_key = " "
    secret_key = " "    
}

resource "aws_instance" "example" {
  ami           = "ami-08be951cec06726be"
  instance_type = "t2.micro"
}