FROM connormanning/greyhound

MAINTAINER John Wass <jwass3@gmail.com>

ENV GREYHOUND_BUILDER_VERSION 0.1

LABEL io.k8s.description="Greyhound Point Cloud Building and Serving Platform" \
      io.k8s.display-name="Greyound Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,greyhound,entwine,pointcloud" \
      io.openshift.s2i.scripts-url=file:///usr/libexec/s2i

COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir /entwine \
 && chown -R 1001:1001 /opt/data /greyhound /entwine /usr/libexec/s2i

USER 1001

EXPOSE 8080

ENTRYPOINT []
CMD ["/usr/libexec/s2i/usage"]
