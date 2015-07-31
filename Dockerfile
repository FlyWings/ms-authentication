FROM openshift/base-centos7
MAINTAINER Chengchang Wang <chengchang.wang@vipshop.com>

EXPOSE 8587

ENV IMAGE_VERSION 1.0

LABEL io.k8s.description="Virtual Vehicle Authentication Service" \
      io.k8s.display-name="Authentication" \
      io.openshift.expose-services="8587:http" \
      io.openshift.tags="builder,service,authentication" \
      io.openshift.s2i.destination="/opt/s2i/destination"


    

#ADD config config/
ADD pom.xml /apps/pom.xml
ADD startAuth.sh /apps/startAuth.sh
ADD src/ /apps/src/
ADD config/ /apps/config/

#ADD dependency-reduced-pom.xml /apps/dependency-reduced-pom.xml
#ADD zip-with-dependencies.xml /apps/zip-with-dependencies.xml
#ADD README.md /apps/README.md

WORKDIR /apps
#ADD Valet /apps/
RUN chmod -R go+rw /apps && \
	chmod +x /apps/startAuth.sh
	


ENTRYPOINT ["/bin/bash", "./startAuth.sh"]
