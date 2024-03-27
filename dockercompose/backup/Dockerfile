FROM ubuntu

RUN apt update -y
RUN apt install -y cifs-utils mariadb-client
RUN apt install -y iputils-ping net-tools

RUN mkdir /mnt/orangehrm

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]