FROM python:3.8
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 7000
CMD python -m http.server 7000