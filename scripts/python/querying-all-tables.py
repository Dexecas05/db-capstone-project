# Import libraries
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

cursor = conn.cursor()

# -----------------------------
# Get all tables
# -----------------------------
cursor.execute("SHOW TABLES")
tables = [t[0] for t in cursor.fetchall()]

# -----------------------------
# Query each table and store results
# -----------------------------
results = {}

for table in tables:
    print(f"Fetching {table}...")
    df = pd.read_sql(f"SELECT * FROM {table}", conn)
    results[table] = df

cursor.close()
conn.close()

# -----------------------------
# Display results
# -----------------------------
for table, df in results.items():
    print(f"\n=== {table} ===")
    print(df.head())  # show first rows for readability
