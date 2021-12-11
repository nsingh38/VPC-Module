# Calling module
module "vpc1" {
  source = "./modules/VPC"

  vpc_cidr     = var.vpc_cidr
  public1_cidr = var.public1_cidr
  public2_cidr = var.public2_cidr
  public3_cidr = var.public3_cidr
  public1_az   = var.public1_az
  public2_az   = var.public2_az
  public3_az   = var.public3_az

  private1_cidr = var.private1_cidr
  private2_cidr = var.private2_cidr
  private3_cidr = var.private3_cidr
  private1_az   = var.private1_az
  private2_az   = var.private2_az
  private3_az   = var.private3_az

}
