#create container from image "python:3.9"
FROM python:3.9

RUN apt-get install wget
# install pandas within container
RUN pip install pandas sqlalchemy psycopg2 pyarrow

# this line creates dir /app in container and the cd to it
WORKDIR /app
# and copy the file "ingest_data.py" from the host to this directory
COPY ingest_data.py ingest_data.py


#ENTRYPOINT [ "bash" ]

# override the entry point: execute: python popeline.py
ENTRYPOINT [ "python", "ingest_data.py" ]