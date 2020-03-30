import psycopg2
import sqlalchemy as db
engine = db.create_engine('postgresql://user:pass@localhost:5432')
connection = engine.connect()

sql = connection.execute('select (first_name, last_name, hire_date) from "sql-challenge".employees where (extract(year from hire_date )) = 1986;')
for row in sql:
        print(row[0])


'''
inspector = db.inspect(engine)
schemas = inspector.get_schema_names()

for schema in schemas:
    print("schema: %s" % schema)
'''



