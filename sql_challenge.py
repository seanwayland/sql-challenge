import psycopg2
from connection import user
from connection import password
import sqlalchemy as db
import pandas as pd
connectionString = "postgresql://" + user + ":" + password + "@localhost:5432"
print(connectionString)
engine = db.create_engine(connectionString)
connection = engine.connect()

sql = ('select (first_name) from "sql-challenge".employees where (extract(year from hire_date )) = 1986;')
for row in sql:
        print(type(row))

df = pd.read_sql(sql, connection)
print(df)
'''
inspector = db.inspect(engine)
schemas = inspector.get_schema_names()

for schema in schemas:
    print("schema: %s" % schema)
'''



