Zen Ansible (Docker)
====================

This image will build an Ansible deployment node for Docker. The build will first run a `yum update`, install a few utility packages, install Ansible, and generate an SSH host key for the Docker node (so it too could be provisioned if required). It will also copy over the Ansible hosts file and config file from `conf/` to `/etc/ansible`, and add the generated SSH key to `/root/.ssh/authorized_keys`.

A default run script, `autoexec.sh`, is included and executed if no command is specified at runtime.

Requirements
------------

This image is based on my CentOS 7 Docker base image, however, this should work with the base image from Docker.io.

- My CentOS 7 Docker Base:
  https://github.com/jchristianh/docker_c7base.git

- Docker.io CentOS 7 Base:
  CentOS 7.2.1511 / docker pull docker.io/centos:7.2.1511
  CentOS 7.3.1611 / docker pull docker.io/centos:7.3.1611

Running the Container
---------------------

A start script is provided in the Git repo, `start.sh`. This script has several variables defined to assist in starting the container in a functional state.

- Start Script Variables:
  `CIMG` / Name of the Docker image (minus the tag)
  `CTAG` / Tag of the Docker image (latest, dev, prod, 1.0, etc)
  `CNAME` / This will set both the name of the container and the hostname of the container to `value`
  `CONFBASE` / This is a base level location which we utilize from `PLAYBOOKS` to build the path to your Ansible files (Playbooks, Roles, etc)
  `PLAYBOOKS` / Location from `CONFBASE` to your Playbooks/Roles/Etc.


- To Execute Script:
  `# ./start.sh`


License
-------

GPL v2

Author Information
------------------

Chris Hammer <chris@thezengarden.net>
