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
                                                                                
CMD cd                                                                          
RUN git clone http://git.linaro.org/lng/odp.git && cd odp                      
CMD ./bootstrap                                                                
CMD ./configure.ac                                                  
CMD make 
# Installing Pipework inside the RouteFlow container                            
#COPY https://github.com/jpetazzo/pipework/blob/master/pipework /usr/sbin/pipework
#RUN chmod +x /usr/sbin/pipework                                                
                                                                                
# Cloning of the RouteFlow repository in "/var" directory                       
#RUN git clone https://github.com/borntorock/dockerize_routeflow.git /var       
                                                                                
# Providing executable permissions to build script of RouteFlow                 
#RUN chmod +x /var/dockerize_routeflow/RouteFlow/build.sh                       
                                                                                 
# Building RouteFlow by executing the build script                               
#RUN /var/dockerize_routeflow/RouteFlow/build.sh -c -z ryu                        
                                                                                 
EXPOSE 6653  
