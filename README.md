## 1. What is PostgreSQL?

PostgreSQL is a popular and most advanced relational database management system(RDBMS). It is open-source, which means anyone can see and contribute to it's codebase.

## 2. What is the purpose of a database schema in PostgreSQL?

Schema is like a folder inside a database. It organizes database objects such as table, view, function and more.

### Purpose of using schema in postgresql

1. Organized database objects - Helps keep related tables, views and functions group together.
2. Avoid name conflicts - Allows object with the same name to exist with different schema.
3. Control access and permission - Permission can be grunted or restricted at the schema level.
4. Easer database maintain and scalability - Make it easer manage and scale large database.
5. Better development workflow -

## 3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.

Primary key- Primary key is a column (or group of column) in a table that uniquely identify each row in that table.

key points-

1. Uniqueness - two rows can't have same primary key
2. Not null - A primary key column can't contain null
3. One per table - each table can have only one primary key

Foreign key- Foreign key is a column (or group of columns) that references the primary key of another table. Foreign key establishing a link between two tables. The table which is contain foreign key called "children table" and the table which it refers is known as "parent table".

## 4. What is the difference between the VARCHAR and CHAR data types?

CHAR- CHAR is a SQL data type that stored fixed length character strings. If the input string shorter then the defined length, it is padded with space to reach the specified length.

VARCHAR- VARCHAR is also a SQL data type that stored variable-length character strings. Unlike CHAR , it only take as much as space needed.

| Feature         | `CHAR`                                | `VARCHAR`                              |
| --------------- | ------------------------------------- | -------------------------------------- |
| **Definition**  | Fixed-length character string         | Variable-length character string       |
| **Padding**     | Pads with spaces if input is shorter  | No padding                             |
| **Performance** | Slightly faster for fixed-length data | More space-efficient for variable data |

## 5.Explain the purpose of the WHERE clause in a SELECT statement.

The WHERE clause is used to specify a condition while fetching data in a database. It filters the rows those are meet the condition.

WHERE helps you fetch only the data you need, instead of all the rows in a table.

## 6. What are the LIMIT and OFFSET clauses used for?

The `LIMIT` and `OFFSET` clause are commonly use for pagination data in PostgreSQL.

-   `LIMIT:` Specifies the maximum number of rows to return.
-   `OFFSET:` Specifies the number of row to skip before starting to return rows.

```
    select * from users LIMIT 10 OFFSET 5;

```

## 7. How can you modify data using UPDATE statements?

We can modify existing records in a table using `UPDATE` statement.

here is the example

```
UPDATE rangers SET name='Ashif', region = 'Dhaka' where ranger_Id = 1
```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

`JOIN` is use to combine multiple table rows together. It allow us to query related data stored in different tables.

Most common types of join are: 
- `INNER JOIN:` Return common rows from both tables.
- `LEFT JOIN:` Return all data from left table and matched data from right table. 
- `RIGHT JOIN:` Return all data from right table and matched data from left table. 
- `FULL JOIN:` Return all data from both table, whether there is match or not. 

## 9. Explain the GROUP BY clause and its role in aggregation operations.

`GROUP BY` operator used to group rows that have same values in a specific column. When we use aggregation function like `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()` we use `GROUP BY` clause. 
