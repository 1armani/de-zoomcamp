
import pandas as pd

import pyarrow.parquet as pq

import os

from sqlalchemy import create_engine

import argparse

import psycopg2

from time import time

def main(params):
    user = params.user
    password = params.password
    host = params.host
    port = params.port
    db = params.db
    url = params.url
    table_name = params.table_name
    
    csv_name = 'output.csv'
    parquet_name = 'output.parquet'

    print(f"wget {url} -O {parquet_name}")
    os.system(f"wget {url} -O {parquet_name}")

    #wtf??

    # create conn to the postgres
    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')

    # connect to pg
    engine.connect()


    # read parquet file from the localhost
    trips = pq.read_table(parquet_name)

    # convert to the pandas table
    trips = trips.to_pandas()

    # create DDL (create table script) from the pandas table
    print(pd.io.sql.get_schema(trips, name=table_name, con=engine))

    #connect to db and create table (no insert data). head(n=0) means filter to get 0 rows
    trips.head(n=0).to_sql(name=table_name, con=engine, if_exists='replace')

    parquet_file = pq.ParquetFile(parquet_name)

    # iterate over parquet file
    for batch in parquet_file.iter_batches(batch_size=10000):
        t_start = time()

        batch_df = batch.to_pandas()
        
        batch_df.to_sql(name=table_name, con=engine, if_exists='append')
        t_end = time()
        print(f'inserted another chunk, took %.3f seconds' %(t_end - t_start))

    print('finished!!')


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Ingest CSV data to Postgres')

    # user
    # password
    # host
    # port
    # database name
    # table name
    # url of the

    parser.add_argument('--user', help='user name for postgres')
    parser.add_argument('--password', help='password for postgres')
    parser.add_argument('--host', help='host for postgres')
    parser.add_argument('--port', help='port for postgres')
    parser.add_argument('--db', help='database name for postgres')
    parser.add_argument('--table_name', help='name of the table where we will write the results to')
    parser.add_argument('--url', help='url of the csv file')

    args = parser.parse_args()

    main(args)



