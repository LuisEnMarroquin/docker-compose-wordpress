# Docker Compose WordPress

Deploy self hosted WordPress using Docker easier than ever

## Requirements

At first a machine with inbound and outbound ports `HTTP (80)` and `HTTPS (443)` enabled.

You need to point your domain to your web server and wait some time for changes to propagate.
Often the time to wait is only a few hours but on occasions it can take as long as 48 hours

Here is my example of domain pointing

| Name                 | Type | TTL | IP address    |
|----------------------|------|-----|---------------|
| db.luismarroquin.com | A    | 1hr | 40.77.100.215 |
| wp.luismarroquin.com | A    | 1hr | 40.77.100.215 |

## Deploy services

1. Install the following command line tools

* [Docker Engine](https://docs.docker.com/engine/install)
* [Docker Compose](https://docs.docker.com/compose/install)

If you are using **Ubuntu Server** you could use this commands

```shell
# Download Docker convenience script
curl -fsSL https://get.docker.com -o get-docker.sh

# Execute the script
sudo sh get-docker.sh

# Add your user to the Docker group
sudo usermod -aG docker $USER

# Refresh Docker group changes
newgrp docker

# Test that Docker is working
docker run hello-world

# Download Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to Compose
sudo chmod +x /usr/local/bin/docker-compose

# Test Compose installation
docker-compose --version

# Update the package lists
sudo apt update -y

# Install the latest versions of all packages
sudo apt upgrade -y

# Remove previously required packages
sudo apt autoremove -y

# Reboot is recommended
sudo reboot
```

2. Get this repo code and move to folder

```shell
git clone --depth 1 https://github.com/LuisEnMarroquin/docker-compose-wordpress.git
cd docker-compose-wordpress
```

3. Create `.env` file with your information

Here is an example

```env
WP_USER=luis
WP_PASS=secretPassword
WP_DATABASE=myDatabase
WP_ROOTUSER=anotherPassword
URL_WP=wp.luismarroquin.com
URL_DB=db.luismarroquin.com
CERT_EMAIL=me@marroquin.dev
```

This file can also be created sending all arguments positionally as follows

```shell
sh dotenv.sh luis secretPassword myDatabase anotherPassword wp.luismarroquin.com db.luismarroquin.com me@marroquin.dev
```

4. Run the following commands

```shell
docker-compose -f compose.yml pull
docker-compose -f compose.yml --project-name main up -d --remove-orphans
```

## Remove services

```shell
# Stop services
docker stop service_phpmyadmin service_wordpress service_mysql proxy_letsencrypt proxy_nginx

# Remove unused containers, networks and volumes
docker system prune --volumes
```
