FROM debian:buster

#yate
COPY deps/yate_5.5-1_amd64.deb /tmp/
RUN apt update && apt install -y -f \
  /tmp/yate_5.5-1_amd64.deb \
  python3-pip \
  tcl \
  tcllib \
  tcl-tls

#yate-tcl
COPY deps/yate-tcl /opt/yate-tcl
RUN mkdir /usr/local/share/tcltk && ln -s /opt/yate-tcl/ygi /usr/local/share/tcltk/ygi

RUN pip3 install python-yate requests

#yate-config
COPY config /etc/yate

COPY sounds /opt/sounds

COPY hotline /usr/share/yate/scripts/

ENTRYPOINT [ "/usr/bin/yate", "upstream_broke_it" ]
