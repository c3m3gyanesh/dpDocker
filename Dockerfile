# Dockerfile for building dataplane technology like P4, ODP etc
# Pulling base image
FROM ubuntu:14.04
# Maintainer
MAINTAINER Gyanesh Patra pgyanesh.patra@gmail.com
# Updating and Installing packages
RUN apt-get update && \
    apt-get install -y build-essential \
    	libtool \
		libssl-dev \
		autoconf \
		git-core

#Installing ODP at "/var" directory
RUN git clone http://git.linaro.org/lng/odp.git /var
RUN chmod +x /var/odp/bootstrap
RUN ./configure.ac
RUN make

# Installing Pipework inside this container
#COPY https://github.com/jpetazzo/pipework/blob/master/pipework /usr/sbin/pipework
#RUN chmod +x /usr/sbin/pipework
#EXPOSE 6653
