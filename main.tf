provider "digitalocean" {
}

resource "digitalocean_ssh_key" "default"{
        name="key"
        public_key = "${file("digitalocen.pub")}"
}

resource "digitalocean_droplet" "web_server"{
        image = "ubuntu-18-04-x64"
        name = "webs${count.index}"
        region = "${var.region}"
        size = "1gb"
        private_networking = true
        ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
	count = 2

connection {
	user = "root"
	type = "ssh"
	private_key = "${file(var.pvt)}"
	timeout = "3m"
}

provisioner "remote-exec"{
	inline = [
	"sudo apt-get update",
	"sudo apt-get -y install nginx"
	]
}
}

resource "digitalocean_loadbalancer" "public"{
	name = "loadbalancer-1"
	region = "${var.region}"
	
	forwarding_rule{
		entry_port = "${var.default_port}"
		entry_protocol = "${var.default_protocol}"
		target_port = "${var.default_port}"
		target_protocol = "${var.default_protocol}"
	}
	healthcheck{
		port = 22
		protocol = "tcp"
	}
	droplet_ids = ["${digitalocean_droplet.web_server.*.id}"]
}

resource "digitalocean_domain" "webs_domain"{
	name = "diegos-domain.com"
	ip_address = "${digitalocean_loadbalancer.public.ip}"
}

resource "digitalocean_record" "CNAME-www"{
	domain = "${digitalocean_domain.webs_domain.name}"
	type = "CNAME"
	name = "www"
	value = "@"
}
