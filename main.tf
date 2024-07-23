# Provider (OCI)
provider "oci" {
    tenancy_ocid = var.tenancy_ocid
    private_key_path =  var.private_key_path
    region = var.region
}
# Define VCN
resource "oci_core_vcn" "ci_cd_vcn"{ 
    cidr_block=var.vcn_cidr_block
    compartment_id= var.compartment_id
}  
#define subnet
resource "oci_core_subnet" "cicd_vcn_subnet" {
    #Required
    cidr_block = var.subnet_cidr_block
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.ci_cd_vcn.id
}
# define a compute instance
resource "oci_core_instance" "cicd_instance" {
    availability_domain = data.oci_identity_availability_domains.cicd_instance.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = var.shape
    shape_config{
        memory_in_gbs = 13
        ocpus = 1
    }
    source_details{
        source_id ="ocid1.image.oc1.iad.aaaaaaaa6uqjfy73o5jvx47jvuwhpczh4euram4nxy37744agjoymonbhtrq"
        source_type ="image"
    }
    create_vnic_details{
        assign_public_ip = true
        subnet_id=oci_core_subnet.cicd_vcn_subnet.id
        display_name="CICD_VCN_Subnet"

    }
}
