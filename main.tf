terraform{
	required_providers{
		tls={
			source="hashicorp/tls"
			version="3.0.0"
		}
		local={
                        source="hashicorp/local"
                        version="2.0.0"
                }
	}
}
provider "tls"{
}
provider "local"{
}
resource "tls_private_key" "ssh_key"{
	algorithm="RSA"
	rsa_bits=4096
}
locals{
	private_key=tls_private_key.ssh_key.private_key_pem
	public_key=tls_private_key.ssh_key.public_key_pem
}
resource "local_file" "cloud_config"{
	filename="cloud_config.yaml"
	content=templatefile("${path.module}/cloud-config.yaml.tpl",{private_key=local.private_key,
		public_key=local.public_key})
}
