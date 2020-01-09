FROM centos:centos7.5.1804

WORKDIR /
RUN yum -y install python3 wget \
    && wget https://bootstrap.pypa.io/3.2/get-pip.py \
    && python3 get-pip.py \
    && pip3 install --upgrade pip --no-cache-dir \
    && pip3 install requests --no-cache-dir \
    && pip3 install lxml --no-cache-dir \
    && pip3 install apscheduler --no-cache-dir \
    && yum -y remove wget \
    && yum clean all \
    && rm get-pip.py
COPY ./zmz /zmz
ENV PYTHONIOENCODING UTF-8
CMD ["python3","/zmz/getzmz.py"]


