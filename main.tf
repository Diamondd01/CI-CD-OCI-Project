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
# define a compute instance
 resource "oci_core_instance" "instance-cicd-project1"{
    availability_domain =var.availability_domain
    compartment_id = var.compartment_id
    shape = var.shape
    display_name = "instance-CICD-Project1"
 }
