FROM scratch
MAINTAINER The CentOS Project <cloud-ops@centos.org>
ADD c7-docker.tar.xz /
LABEL name="CentOS Base Image" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="2016-02-17"
RUN yum -y install ruby rubygems ruby-devel gcc ruby-dev wget 
RUN yum -y groupinstall "Development tools"
RUN mkdir /root/wordpress-rpm
RUN /usr/bin/gem install fpm

WORKDIR /root/wordpress-rpm

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xzvf latest.tar.gz

ADD  wp-config.php /root/wordpress-rpm/

#fpm -s dir -t rpm -n WORDPRESS -v   `` -C  /root/wordpress-rpm/  --prefix={INSTALL_LOCATION}
RUN fpm -s dir -t rpm -n wordpress -v   4.4.2 -C /root/wordpress-rpm --prefix=/var/www/html



# Volumes for systemd
# VOLUME ["/run", "/tmp"]

# Environment for systemd
# ENV container=docker

# For systemd usage this changes to /usr/sbin/init
# Keeping it as /bin/bash for compatability with previous
CMD ["/bin/bash"]
