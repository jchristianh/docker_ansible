###################################
#   The Zen Garden :: Ansible     #
#     Build Tag: 170513-00555      #
###################################
FROM docker.thezengarden.net/c7base
MAINTAINER Chris Hammer <chris@thezengarden.net>

# Update base and install required deps:
########################################
RUN yum update -y
RUN yum install -y which git wget openssh-server net-tools ansible
RUN yum clean all

# Generate SSH key for host and user 'root':
############################################
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
    && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
    && ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa \
    && ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ''


# Setup config to remove host key checking:
###########################################
RUN rm -fv /etc/ansible/ansible.cfg \
    && rm -fv /etc/ansible/hosts
COPY conf/ansible.cfg /etc/ansible/ansible.cfg
COPY conf/hosts /etc/ansible/hosts


# Add generated SSH key for root into ~/.ssh/authorized_keys:
#############################################################
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys


# Add localhost to list of ansible hosts:
#########################################
#RUN echo 'localhost' >> /etc/ansible/hosts


# Run script on 'boot':
#######################
COPY autoexec.sh /
CMD ["/autoexec.sh"]
