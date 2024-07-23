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
 resource "oci_core_instance" "cicd_instance"{
    availability_domain =var.availability_domain
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
        display_name="CICD_VCN_Subnet"

    }
 }
