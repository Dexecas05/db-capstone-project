# 🍋 Little Lemon Database Capstone Project

---

## ⚡ Quick Start
1. **Create the database**  
   Run the SQL scripts in `scripts/SQL/` using MySQL Workbench or CLI to set up and populate `littlelemondb`.

2. **Export tables with Python**  
   Run:
   ```bash
   python scripts/python/etl-simulation.py
   ```
   This generates `.csv` files and a single `.xlsx` workbook in `exports/`.

3. **Analyze in Tableau Public**  
   Import `exports/excel/littlelemondb.xlsx`, recreate relationships, and build dashboards (customer spending, top 10 customers, menu profitability).

---

## 📖 Overview
This project is the final capstone for the **Database Engineer specialization**. It simulates the design and implementation of a relational database system for *Little Lemon*, a fictional restaurant. The project demonstrates the full lifecycle of database engineering:

- Designing an **ER diagram** and normalizing to 3NF  
- Implementing the schema in **MySQL Workbench**  
- Populating tables with sample data  
- Writing **SQL queries, procedures, and transactions** for reporting and operations  
- Automating exports with **Python ETL scripts**  
- Performing **business intelligence analysis** in **Tableau Public**  
- Creating a **Python client** to interact with the database  

---

## 📂 Repository Structure

```text
db-capstone-project/
  ├── LittleLemonDB.png        # ER diagram
  ├── README.md                # Project documentation
  ├── scripts/
  │   ├── python/              # Python scripts for ETL and queries
  │   │   ├── etl-simulation.py
  │   │   └── query-customers-over-60.py
  │   └── SQL/                 # SQL scripts for schema, inserts, reports
  ├── results/                 # Query outputs for reporting
  └── exports/                 # ETL outputs for Tableau
      ├── csv/
      ├── excel/
      └── visualizations/
```

---

## 🛠 Setup Instructions

### Prerequisites
- **MySQL Server** (with Workbench recommended)
- **Python 3.10+**
- **Tableau Public Desktop**
- **Git/GitHub** for version control

### Python Dependencies
Install required packages:
```bash
pip install mysql-connector-python pandas openpyxl sqlalchemy
```

### Environment Variables
Set the following for privacy/security:
- `LittleLemonHost` → database host (e.g., `localhost`)
- `LittleLemonUsername` → MySQL username
- `LittleLemonPassword` → MySQL password
- `LittleLemon-outputdir` → path for exports (e.g., `D:\Xequi 2024\Coursera\Meta-database-engineer\exports`)

---

## 🚀 How to Run

1. **Create the database**  
   Run SQL scripts in `scripts/SQL/` using MySQL Workbench or CLI:
   ```sql
   source create_schema.sql;
   source populate_data.sql;
   ```

2. **Run ETL simulation**  
   Export all tables into CSV and Excel:
   ```bash
   python scripts/python/etl-simulation.py
   ```

3. **Run query scripts**  
   Example: customers with orders > $60
   ```bash
   python scripts/python/query-customers-over-60.py
   ```

4. **Check results**  
   - CSVs in `exports/csv/`  
   - Excel workbook in `exports/excel/`  
   - Reporting outputs in `results/`

5. **Analyze in Tableau**  
   - Import `exports/excel/littlelemondb.xlsx`  
   - Recreate relationships between tables  
   - Build dashboards for:
     - Customer spending & profit margin  
     - Top 10 customers by number of orders  
     - Menu item profitability  

---

## 📊 Deliverables
- **ER diagram** (`LittleLemonDB.png`)  
- **SQL scripts** for schema, inserts, queries, procedures, triggers  
- **Python ETL scripts** for automated exports  
- **CSV/Excel datasets** for BI tools  
- **Tableau dashboards** answering business questions  

---

## 🎓 Learning Outcomes
- Relational database design & normalization  
- SQL queries, joins, procedures, triggers, transactions  
- ETL automation with Python  
- BI visualization with Tableau Public  
- Version control with Git/GitHub  

---

## 📊 Tableau Dashboard

Here are some previews of the dashboard:

![Orig Dashboard Screenshot](https://github.com/Dexecas05/db-capstone-project/blob/main/exports/visualizations/orig-dashboard.png)

![Filtered Dashboard Screenshot](https://github.com/Dexecas05/db-capstone-project/blob/main/exports/visualizations/filtered-dashboard.png)

👉 Explore the interactive version on [Tableau Public](https://public.tableau.com/views/LittleLemonRestaurant-top10customerspreferences/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

