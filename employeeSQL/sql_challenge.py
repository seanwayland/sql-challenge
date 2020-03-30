import psycopg2
from connection import user
from connection import password
import sqlalchemy as db
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
'''
connect to postgres database 
user and pass stored in "connection" file 
'''
connectionString = "postgresql://" + user + ":" + password + "@localhost:5432"
print(connectionString)
engine = db.create_engine(connectionString)
connection = engine.connect()

# postgres query
sql = ('select (CAST(salaries.salary AS DEC)  , "sql-challenge".titles.title) from "sql-challenge".salaries join "sql-challenge".titles  on "sql-challenge".salaries.emp_no = "sql-challenge".titles.emp_no ')
# query the DB and save the query as a pandas dataframe
df = pd.read_sql(sql, connection)

# convert back to python

pyth = df.values.tolist()
print(pyth)
salaries = []
titles = []

# store the values in 2 lists
for i in range(1,len(pyth)):
        salaries.append(float(pyth[i][0][1:6]))
        titles.append(pyth[i][0][10:-1])


''' strip the bad characters from the titles results '''

for i in range(len(titles)):

        bad_chars = ['"', ',']
        for j in bad_chars :
                titles[i] = titles[i].replace(j, '')



# convert back into a data frame
df2 = pd.DataFrame(list(zip(titles, salaries)), columns =['titles', 'salaries'])


# print a histogram of the salaries seperated into ranges

bins_list = [40000, 50000, 60000, 80000, 90000, 100000]
data = df2['salaries']

ax = plt.hist(data, bins = bins_list)
plt.title('salary ranges of employees at pewlett hackard')
plt.xlabel('salary range')
plt.ylabel('employee counts in salary range')
plt.show()


# get the average of each employee title and print a plot 
df3 = df2.groupby('titles')
Means = df3.mean()
print(Means)


y = Means['salaries'].tolist()

x = ['Assistant Engineer','Engineer','Manager ','Senior Engineer', 'Senior Staff ', 'Staff', 'Technique Leader' ]

p1 = plt.bar(x,y)

plt.xlabel('Position')
plt.ylabel('Salary in dollars')
plt.title('Average Salary by position at Pewlett Hackard')

plt.show()




