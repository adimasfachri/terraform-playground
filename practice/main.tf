provider "aws" {
    region = "ap-southeast-2"

}   

variable "prod-vpc-cidr" {
    description = "prod vpc cidr"
  
  }


resource "aws_vpc" "prod-vpc" {
    cidr_block = var.prod-vpc-cidr 
    tags = {  
        Name: "Production"
    }
}

resource "aws_subnet" "prod-subnet" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "192.168.0.0/22"
    availability_zone = "ap-southeast-2a"
    tags = {
        Name: "production"
    }
  
}

resource "aws_subnet" "dev-subnet" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "192.168.4.0/22"
    availability_zone = "ap-southeast-2b"
    tags = {
      Name: "development"
    }
  
}

#Masih belum di apply
data "aws_vpc" "existing_vpc" {
    default = true
}

resource "aws_subnet" "prod-subnet-exist" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.0.0/20"
    availability_zone = "ap-southeast-2c"
    tags = {
      Name: "Practice"
    }
  
}



