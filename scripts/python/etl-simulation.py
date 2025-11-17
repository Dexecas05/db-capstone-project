import mysql.connector
import pandas as pd
import os

# -----------------------------
# Fill in your connection details here
# -----------------------------
conn = mysql.connector.connect(
    host= os.getenv("LittleLemonHost"),      
    port=3306,              
    user= os.getenv("LittleLemonUsername"),
    password= os.getenv("LittleLemonPassword"),
    database="littlelemondb"
)

cursor = conn.cursor()
cursor.execute("SHOW TABLES")
tables = [t[0] for t in cursor.fetchall()]

# -----------------------------
# Output directory from environment variable
# -----------------------------
output_dir = os.getenv("LittleLemon-outputdir", "./exports")  # fallback to ./exports if not set

# Create main and subdirectories automatically
csv_dir = os.path.join(output_dir, "csv")
excel_dir = os.path.join(output_dir, "excel")
os.makedirs(csv_dir, exist_ok=True)
os.makedirs(excel_dir, exist_ok=True)

# Excel writer for multi-sheet export
excel_path = os.path.join(excel_dir, "littlelemondb.xlsx")
with pd.ExcelWriter(excel_path, engine="openpyxl") as writer:
    for table in tables:
        print(f"Exporting {table}...")

        # Read table into DataFrame
        df = pd.read_sql(f"SELECT * FROM {table}", conn)

        # Export to CSV
        csv_path = os.path.join(csv_dir, f"{table}.csv")
        df.to_csv(csv_path, index=False)

        # Export to Excel (each table = one sheet)
        df.to_excel(writer, sheet_name=table, index=False)

cursor.close()
conn.close()

print("Export complete!")
print(f"- CSV files saved in: {csv_dir}")
print(f"- Excel workbook: {excel_path}")