pip install opensafely
docker run -it -d --name ehrql --rm ghcr.io/opensafely-core/ehrql:v1 bash
mount=$(docker inspect ehrql -f '{{.GraphDriver.Data.MergedDir}}')
mkdir -p .ehrql
sudo mount --bind -o ro "$mount/app/ehrql" .ehrql
sudo touch /usr/bin/R
sudo mkdir -p /usr/lib/R
sudo mkdir -p /etc/R
docker run -it -d --name r-v2 --rm ghcr.io/opensafely-core/r:v2 bash
mount=$(docker inspect r-v2 -f '{{.GraphDriver.Data.MergedDir}}')
sudo mount --bind -o ro "$mount/usr/bin/R" /usr/bin/R
sudo mount --bind -o ro "$mount/usr/lib/R" /usr/lib/R
sudo mount --bind -o ro "$mount/etc/R" /etc/R
docker run -it -d --name python-v2 --rm ghcr.io/opensafely-core/python:v2 bash
mount=$(docker inspect python-v2 -f '{{.GraphDriver.Data.MergedDir}}')
sudo mkdir -p /opt/venv
sudo mount --bind -o ro "$mount/opt/venv" /opt/venv