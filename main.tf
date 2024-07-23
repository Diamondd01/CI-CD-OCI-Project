# Provider (OCI)
provider "oci" {
    tenancy_ocid = var.tenancy_ocid
    private_key_path =  var.private_key_path
    region = var.region
}
# Define VCN
resource "oci_core_virtual_network" "CI-CD-VCN"{ 
    cidr_block=var.vcn_cidr_block
    compartment_id= var.compartment_id
}
# define a subnet within vcn 
resource "oci_core_subnet" "CICD_VCN_Subnet" { 
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id
}    
# define a compute instance
 resource "oci_core_instance" "instance-CICD-Project1"{
    availability_domain =var.availability_domain
    compartment_id = var.compartment_id
    shape = var.shape
 }
