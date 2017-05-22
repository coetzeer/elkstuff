#!/bin/bash -eu +x

yum update -y
yum install -y docker nginx collectd collectd-java
systemctl enable docker
systemctl start docker
yum install -y elasticsearch
#wget 'https://github.com/christiangalsterer/httpbeat/releases/download/4.0.0/httpbeat-4.0.0-x86_64.rpm'
#rpm install 4.0.0/httpbeat-4.0.0-x86_64.rpm
