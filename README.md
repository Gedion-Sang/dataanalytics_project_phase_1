# dataanalytics_project_phase_1
### **International Debt Analysis Using SQL & Data Visualization**

#### **Project Overview**  
Countries take on debt not just for necessities but to support economic development. Infrastructure spending, for instance, is a costly yet crucial investment for a country’s progress. The World Bank provides debt financing to developing countries to facilitate such initiatives.  

In this project, I will analyze international debt data collected by the World Bank. The dataset includes information on the total debt (in USD) owed by developing countries across multiple debt categories from 1970 to 2015.  

The goal is to explore this dataset using SQL in PostgreSQL, extract meaningful insights, and answer key financial questions.  

---

#### **Project Tasks & Deliverables** 
- To view the data in the dataset
```sql
SELECT * FROM dataanalytics.international_debt;
```

  1. What is the total amount of debt owed by all countries in the dataset?  
To calculate the total debt owed we use the **SUM() function** as shown below
```sql
select sum(debt) as "Total Debt"
from dataanalytics.international_debt;
```
  2. How many distinct countries are recorded in the dataset? 
- To identify distinct or unique countries in the dataset we use the **DISTINCT() function** which doesn't repeat duplicate values.
```sql
select count(distinct country_name) as "Total Countries"
from dataanalytics.international_debt;
 ``` 
  3. What are the distinct types of debt indicators, and what do they represent? 
```sql
select distinct(indicator_code) "Indicator Code", indicator_name ""
from dataanalytics.international_debt;
```
  4. Which country has the highest total debt, and how much does it owe? 
- To calculate the highest total debt owed we use the **SUM() function** as shown below
```sql
select country_name, sum(debt) as "Highest Total Debt"
from datanalytics.international_debt
group by country_name
order by 2 desc
limit 1;
 ```
  5. What is the average debt across different debt indicators? 
- To calculate the average debt owed we use the **AVG() function** as shown below
```sql
select country_name, avg(debt) "Average_Debt", indicator_code
from datanalytics.international_debt
group by country_name, indicator_code;
```
  6. Which country has made the highest amount of principal repayments?  
```sql
select country_name, sum(debt) "Highest Principal Repayment",indicator_name, indicator_code
from datanalytics.international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name ,indicator_name,indicator_code
order by 2 desc;
```
  7. What is the most common debt indicator across all countries?
- To determine the most occuring valuewe use the **COUNT() function**
which calculates the frequency of occurence of the value 
```sql
select indicator_name, indicator_code, count(indicator_code) as "Frequency"
from datanalytics.international_debt
group by indicator_name, indicator_code
order by 3 desc;
 ``` 
  8. Identify any other key debt trends and summarize your findings.  
