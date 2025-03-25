-- To view the data in the table.
select * from dataanalytics.international_debt;


-- What is the total amount of debt owed by all countries in the dataset?
select sum(debt) as "Total Debt"
from dataanalytics.international_debt;

-- How many distinct countries are recorded in the dataset?
select count(distinct country_name) as "Total Countries"
from dataanalytics.international_debt;

-- What are the distinct types of debt indicators, and what do they represent?
select distinct(indicator_code) "Indicator Code", indicator_name ""
from dataanalytics.international_debt;

-- Which country has the highest total debt, and how much does it owe?
select country_name, sum(debt) as "Highest Total Debt"
from dataanalytics.international_debt
group by country_name
order by 2 desc
limit 1;

-- What is the average debt across different debt indicators?
select country_name, avg(debt) "Average_Debt", indicator_code
from dataanalytics.international_debt
group by country_name, indicator_code
;

-- Which country has made the highest amount of principal repayments?
select country_name, sum(debt) "Highest Principal Repayment",indicator_name, indicator_code
from dataanalytics.international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name ,indicator_name,indicator_code
order by 2 desc;


-- What is the most common debt indicator across all countries?
select indicator_name, indicator_code, count(indicator_code) as "Frequency"
from dataanalytics.international_debt
group by indicator_name, indicator_code
order by 3 desc;

-- Identify any other key debt trends and summarize your findings.

select indicator_name, indicator_code, max(debt) "Maximum Debt" , count(indicator_code) "Most Frequent"
from dataanalytics.international_debt
where indicator_name not like '%repayment%'
group by indicator_name, indicator_code
order by 1 desc ;