FROM m4niak/liferaywithmysql

MAINTAINER m4niak <alt.kuba@gmail.com>

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y \
    unzip \
    supervisor
RUN yum clean all

RUN curl -O -k -L https://releases.liferay.com/portal/7.2.0-ga1/liferay-ce-portal-tomcat-7.2.0-ga1-20190531153709761.7z \
 && 7za x -o/opt liferay-ce-portal-tomcat-7.2.0-ga1-20190531153709761.7z \
 && rm liferay-ce-portal-tomcat-7.2.0-ga1-20190531153709761.7z
RUN ln -s /opt/liferay-ce-portal-7.2.0-ga1 /opt/liferay \
 && ln -s /opt/liferay/tomcat-9.0.17 /opt/liferay/tomcat
RUN echo -e '\nCATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom"' >> /opt/liferay/tomcat/bin/setenv.sh

COPY assets/supervisord.conf /etc/supervisord.conf
COPY assets/init.sh /opt/liferay/init.sh

VOLUME ["/opt/liferay"]

EXPOSE 8080

CMD /usr/bin/supervisord -n
