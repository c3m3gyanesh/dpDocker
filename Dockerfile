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

#Installing ODP
RUN cd
RUN git clone http://git.linaro.org/lng/odp.git
RUN cd odp
RUN chmod +x bootstrap
RUN ./configure.ac
RUN make

#Installing P4factory
RUN cd
RUN git clone https://github.com/p4lang/p4factory.git
RUN cd p4factory
#Update the submodules for this repo.
#Run the following command everytime the latest version of master is pulled.
RUN git submodule update --init --recursive
#Install all the Ubuntu 14.04 dependencies
RUN ./install.sh
RUN ./autogen.sh
RUN ./configure

# Installing Pipework inside this container
#COPY https://github.com/jpetazzo/pipework/blob/master/pipework /usr/sbin/pipework
#RUN chmod +x /usr/sbin/pipework
#EXPOSE 6653
