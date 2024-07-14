#These are the only value that need to be changed on implementation
region                      = "eu-west-1"
vpc_cidr                    = "10.0.0.0/16"
public_subnet_1             = "10.0.16.0/20"
public_subnet_2             = "10.0.32.0/20"
private_subnet_1            = "10.0.80.0/20"
private_subnet_2            = "10.0.112.0/20"
availibilty_zone_1          = "eu-west-1a"
availibilty_zone_2          = "eu-west-1b"
container_port              = 3000
credential_profile          = "evvo" # Replace with what you named your profile