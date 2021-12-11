variable "vpc_cidr" {
  type        = string
  description = "Enter your vpc cidr here"
}

variable "public1_cidr" {
  type        = string
  description = "Enter your public subnet 1 cidr here"
}
variable "public2_cidr" {
  type        = string
  description = "Enter your public subnet 2 cidr here"
}
variable "public3_cidr" {
  type        = string
  description = "Enter your public subnet 3 cidr here"
}

variable "private1_cidr" {
  type        = string
  description = "Enter your private subnet 1 cidr here"
}
variable "private2_cidr" {
  type        = string
  description = "Enter your private subnet 2 cidr here"
}
variable "private3_cidr" {
  type        = string
  description = "Enter your private subnet 3 cidr here"
}

variable "public1_az" {
  type        = string
  description = "Enter your public subnet 1 availability zone here"
}
variable "public2_az" {
  type        = string
  description = "Enter your public subnet 2 availability zone here"
}
variable "public3_az" {
  type        = string
  description = "Enter your public subnet 3 availability zone here"
}

variable "private1_az" {
  type        = string
  description = "Enter your private subnet 1 availability zone here"
}
variable "private2_az" {
  type        = string
  description = "Enter your private subnet 2 availability zone here"
}
variable "private3_az" {
  type        = string
  description = "Enter your private subnet 3 availability zone here"
}
