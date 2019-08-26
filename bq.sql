
-- split columns
SELECT 
	CONCAT(column1, "-", column2),
	split(category,"-")[ORDINAL(1)] ,split(category,"-")[ORDINAL(2)] 

--
SELECT *
FROM  `SalesTransHeader.salestrans_d*`
WHERE (_TABLE_SUFFIX between '{sale_min_d}' and '{sale_max_d}')

-- SUM(IF)
SELECT SUM(IF(col1 is NULL, 1, 0)) as n_null
FROM ...

-- from TIMESTAMP substring YEAR or DATE
select EXTRACT(YEAR from transaction_date) as year, EXTRACT(DATE from transaction_date) as date
from ...

-- DATE_DIFF()
SELECT DATE_DIFF(DATE '2010-07-07', DATE '2008-12-25', DAY) as days_diff
DAY, WEEK, MONTH, YEAR, QUATER
DATE_SUB
DATE_ADD

-- PARTITIRON BY �� group by ���c�� �����Ա�������׃��
select a, b, fun() OVER (partition by groups) name
from table

select rank() over(partition by year, product_id order by unit_price )

-- LEAD: �؂���һ���Y���е�ֵ
select a, LEAD(value, offset, default_expression) OVER (PARTITION by col1 orber by col2) 
from ...
value: ��һ���Y���е��{���Q
offset: 1���A�O����һ��
default_expression: �]���Y�ϵ��A�O�ʬF Null 

SELECT name,
  finish_time,
  division,
  LEAD(name, 1,'Nobody')
    OVER (PARTITION BY division ORDER BY finish_time) AS two_runners_back
FROM 

-- ROW_NUMBER() ����o��̖
ROW_NUMBER() OVER ( PARTITION BY uid ORDER BY date ) AS seq

-- percenttile һ��Ҫ��over() һ����
 SELECT 
  PERCENTILE_CONT(x, 0) OVER() AS min,
  PERCENTILE_CONT(x, 0.01) OVER() AS percentile1,
  PERCENTILE_CONT(x, 0.5) OVER() AS median,

-- MOD ���� x ���� y ���N��
MOD(x, y)

--
SELECT *
FROM ...
INNER JOIN on(A.key1 = B.key1 AND A.key2 = B.key2)

LEFT JOIN USING(id)


