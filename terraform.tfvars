
vpc_name    = "my-vpc"
region      = "us-central1"
router_name = "my-router"
nat_name    = "my-nat-gateway"

subnet_configs = [
  {
    name = "public-subnet"
    cidr = "10.0.1.0/24"
  },
  {
    name = "private-subnet-1"
    cidr = "10.0.2.0/24"
  },
   ]

firewalls = [
  {
    name          = "allow-ssh-iap"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["35.235.240.0/20"]
  },
  {
    name          = "allow-lb-healthcheck"
    direction     = "INGRESS"
    priority      = 1000
    protocol      = "tcp"
    ports         = ["0-65535"]
    source_ranges = ["130.211.0.0/22","35.191.0.0/16"]
  },   
]