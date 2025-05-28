#!/bin/bash
mkdir -p tempdir/templates tempdir/static
cp sample_app.py tempdir/
cp -r templates/* tempdir/templates/
cp -r static/* tempdir/static/

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask gunicorn" >> tempdir/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  sample_app.py /home/myapp/" >> tempdir/Dockerfile
echo "WORKDIR /home/myapp" >> tempdir/Dockerfile
echo "ENV PYTHONPATH /home/myapp" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD gunicorn --bind 0.0.0.0:9999 sample_app:sample" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .
docker rm -f samplerunning 2>/dev/null
docker run -d -p 9999:9999 --name samplerunning sampleapp
docker ps -a
