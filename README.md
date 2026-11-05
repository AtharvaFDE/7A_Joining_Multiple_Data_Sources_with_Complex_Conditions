# 7A - Joining Multiple Data Sources with Complex Conditions

## 📌 Project Overview

This project demonstrates how to combine multiple data sources using **MySQL, Python, and Pandas**.

The objective is to extract data from Sales, Customers, and Products tables, perform multiple table joins, apply complex business filtering conditions, and calculate sales performance through data aggregation and visualization.

## 🎯 Objectives

- Extract data from MySQL databases.
- Join multiple tables using Pandas.
- Perform INNER JOIN, LEFT JOIN, and RIGHT JOIN.
- Apply complex filtering conditions.
- Calculate total sales by region, product, and customer.
- Perform customer segmentation.
- Identify top customers and best-selling products.
- Visualize sales insights using Matplotlib and Seaborn.
- Export analysis results into CSV files.

## 🛠️ Technologies Used

- Python
- MySQL
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn
- MySQL Connector

## 📂 Project Structure

```text
7A_Joining_Multiple_Data_Sources_with_Complex_Conditions/
│
├── Sales_Analysis_Multiple_Table_Joins.sql
│
├── Sales_Analysis_Using_Python_Pandas.ipynb
│
├── requirements.txt
│
├── README.md
│
├── inner_join_results.csv
├── filtered_sales.csv
├── region_sales.csv
├── product_sales.csv
└── customer_sales.csv
```

## 🗄️ Database Structure

The project uses three MySQL tables:

### 1. Sales
- sale_id
- customer_id
- product_id
- quantity
- sale_amount
- sale_date

### 2. Customers
- customer_id
- customer_name
- region
- city

### 3. Products
- product_id
- product_name
- category
- price

## 🔗 Data Joining Operations

The project implements three types of joins using Pandas:

| Join Type | Purpose |
|---|---|
| INNER JOIN | Retrieve matching records from multiple tables |
| LEFT JOIN | Retrieve all customers and their sales |
| RIGHT JOIN | Retrieve all products, including unsold products |

## 🔍 Business Filtering Conditions

The project applies the following business rules:

- Sales amount greater than ₹10,000.
- Quantity greater than or equal to 2.
- Product categories limited to Electronics and Furniture.
- Regions limited to West and North.
- Sales dates between January and March 2026.

## 📊 Data Analysis

The following analysis is performed:

1. Total sales by region.
2. Total sales by product.
3. Total sales by customer.
4. Customer segmentation.
5. Top 5 customers by sales.
6. Best-selling product.
7. Total revenue.
8. Average order value.

## 📈 Data Visualization

Visualizations are created using Matplotlib and Seaborn:

- Region-wise sales analysis.
- Product-wise sales analysis.
- Customer-wise sales analysis.
- Customer segmentation analysis.

## ⚙️ Installation and Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/AtharvaFDE/7A_-Joining_Multiple_Data_Sources_with_Complex_Conditions.git
```

### Step 2: Navigate to Project Directory

```bash
cd 7A_-Joining_Multiple_Data_Sources_with_Complex_Conditions
```

### Step 3: Install Required Packages

```bash
pip install -r requirements.txt
```

### Step 4: Configure MySQL

- Install and start MySQL Server.
- Create the `sales_analysis` database.
- Create the Sales, Customers, and Products tables.
- Insert the sample records using the provided SQL file.

### Step 5: Configure Database Connection

Update your MySQL credentials in the Jupyter Notebook:

```python
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="YOUR_PASSWORD",
    database="sales_analysis"
)
```

### Step 6: Run Jupyter Notebook

```bash
jupyter notebook
```

Open `Sales_Analysis_Using_Python_Pandas.ipynb` and execute the cells.

## 📦 Requirements

```text
mysql-connector-python
pandas
numpy
matplotlib
seaborn
```

## 💡 Key Python Functions Used

| Function | Description |
|---|---|
| `pd.read_sql()` | Extract data from MySQL |
| `pd.merge()` | Join multiple DataFrames |
| `groupby()` | Group data |
| `agg()` | Perform aggregations |
| `query()` | Filter records |
| `isin()` | Filter multiple values |
| `sort_values()` | Sort data |
| `nlargest()` | Find top records |
| `apply()` | Apply custom functions |
| `to_csv()` | Export results |

## 🏆 Learning Outcomes

Through this project, I gained practical experience in:

- Working with MySQL databases.
- Connecting Python with MySQL.
- Combining multiple datasets.
- Performing complex data filtering.
- Applying data aggregation techniques.
- Analyzing customer and product sales.
- Creating meaningful data visualizations.
- Generating business insights using Python.

## 👨‍💻 Author

**Atharva**

GitHub: [@AtharvaFDE](https://github.com/AtharvaFDE)

---

⭐ If you find this project useful, feel free to explore the repository!
