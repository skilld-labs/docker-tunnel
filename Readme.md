# Tunnel image

## Description
Run tunnel for unavailable source through some server

## Variables
* `BIND_HOST` - what host to use for binding destination resource
* `BIND_PORT` - what port to use for binding destination resource
* `REMOTE_HOST` - Destination resource
* `REMOTE_PORT` - Destination port
* `SSH_HOST_USER` - ssh user for tunnel host server
* `SSH_HOST_NAME` - ssh hostname
* `SSH_HOST_PORT` - ssh port
* `SSH_HOST_PASSWORD` - ssh password for tunnel host server
* `SSH_TUNNEL_KEY` - ssh private key file for tunnel host server

## Example with password host authentication
```
  php:
    image: image_name
    container_name: "dev_php"
    extra_hosts:
      - "unavailable-host.com:127.0.0.1"
  ssh_tunnel:
    container_name: "dev_ssh_tunnel"
    image: skilldlabs/ssh-tunnel
    depends_on:
      - php
    environment:
      BIND_HOST: 127.0.0.1
      BIND_PORT: 443
      REMOTE_HOST: unavailable-host.com
      REMOTE_PORT: 443
      SSH_HOST_USER: user
      SSH_HOST_NAME: dev-server.com
      SSH_HOST_PORT: 1336
      SSH_HOST_PASSWORD: *******
    network_mode: "service:php"
```

## Example with key host authentication
```
  php:
    image: image_name
    container_name: "dev_php"
    extra_hosts:
      - "unavailable-host.com:127.0.0.1"
  ssh_tunnel:
    container_name: "dev_ssh_tunnel"
    image: skilldlabs/ssh-tunnel
    depends_on:
      - php
    volumes:
      # Private key file should be placed at root dir in container
      - ./ssh_private_key:/ssh_private_key:z
    environment:
      BIND_HOST: 127.0.0.1
      BIND_PORT: 443
      REMOTE_HOST: unavailable-host.com
      REMOTE_PORT: 443
      SSH_HOST_USER: user
      SSH_HOST_NAME: dev-server.com
      SSH_HOST_PORT: 1336
      SSH_TUNNEL_KEY: ssh_private_key
    network_mode: "service:php"
```

