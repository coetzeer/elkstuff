#!/bin/bash -eu +x

cat << 'EOF' > /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-5.x]
name=Elasticsearch repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

yum update -y
yum install -y docker nginx collectd collectd-java
# systemctl enable docker
# systemctl start docker

#wget 'https://github.com/christiangalsterer/httpbeat/releases/download/4.0.0/httpbeat-4.0.0-x86_64.rpm'
#rpm install 4.0.0/httpbeat-4.0.0-x86_64.rpm
