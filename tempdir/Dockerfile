FROM python
RUN pip install flask gunicorn
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
COPY  sample_app.py /home/myapp/
WORKDIR /home/myapp
ENV PYTHONPATH /home/myapp
EXPOSE 5050
CMD gunicorn --bind 0.0.0.0:9999 sample_app:sample
