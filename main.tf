# Provider (OCI)
provider "oci" {
    tenancy_ocid = var.tenancy_ocid
    private_key_path =  var.private_key_path
    region = var.region
}
# Define VCN
resource "oci_core_virtual_network" "CI-CD-VCN"{ 
    cidr_block=var.vcn_cidr_block
}
# define a subnet within vcn 
resource "oci_core_virtual_subnet" "public subnet-CI-CD-VCN" { 
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id
    display_name =  "public subnet-CI-CD-VCN"
}    
# define a compute instance
 resource "oci_core_instance" "instance-CICD-OCI"{
    availability_domain =var.availability_domain
    compartment_id = var.compartment_id
    shape = var.shape
    subnet_id = var.subnet_id
# metadata for the instance 
    metadata {
        ssh_authorized_keys=  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx+V+Z0D/eaxICN3heR3f3OyFTkQ2NaUTlMtY3cv7MA"
    }
 }
