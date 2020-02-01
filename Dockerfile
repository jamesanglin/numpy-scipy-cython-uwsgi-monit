FROM jamesanglin/numpy-scipy-cython-uwsgi

WORKDIR /root
RUN wget https://mmonit.com/monit/dist/monit-5.26.0.tar.gz
RUN tar xvfz monit-5.26.0.tar.gz

WORKDIR /root/monit-5.26.0
RUN ./configure --without-pam
RUN make && make install
RUN cd /root/monit-5.26.0 && cp monitrc /usr/local/etc/
RUN mkdir -p /usr/local/etc/monit.d && echo "include /usr/local/etc/monit.d/*" >> /usr/local/etc/monitrc
