import mysql.connector
import pandas as pd
import os

# -----------------------------
# Connection details (use env vars for privacy)
# -----------------------------
conn = mysql.connector.connect(
    host=os.getenv("LittleLemonHost"),      
    port=3306,
    user=os.getenv("LittleLemonUsername"),
    password=os.getenv("LittleLemonPassword"),
    database="littlelemondb"
)

# -----------------------------
# Query: Customers with orders > $60
# -----------------------------
query = """
SELECT DISTINCT c.first_name, c.last_name, c.phone, c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_cost > 60;
"""

df = pd.read_sql(query, conn)
df.to_csv("results/customers_over_60.csv", index=False)


# -----------------------------
# Print results
# -----------------------------
print("Customers with orders > $60:")
print(df)

conn.close()
