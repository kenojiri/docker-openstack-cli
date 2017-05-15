FROM alpine:edge
RUN apk add --no-cache openssl python3 bash&&\
    wget https://bootstrap.pypa.io/get-pip.py -O - | python3 &&\
    ln -s /usr/bin/pip3 /usr/bin/pip
RUN apk add --no-cache python3-dev gcc py3-netifaces py3-pbr &&\
    pip install python-openstackclient &&\
    pip install python-keystoneclient &&\
    pip install python-swiftclient &&\
    pip install python-novaclient &&\
    pip install python-glanceclient &&\
    pip install python-cinderclient &&\
    pip install python-neutronclient &&\
    apk del python3-dev gcc &&\
    mkdir -p /config
