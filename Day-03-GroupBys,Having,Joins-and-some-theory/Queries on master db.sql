select name,xtype,COUNT(xtype) from sysobjects group by xtype,name

select * from sysobjects

select 
name,xtype,
COUNT(xtype) as CountOfObjects 
from sysobjects
group by xtype,name

select 
name,xtype,
COUNT(xtype) as CountOfObjects 
from sysobjects
group by xtype,name
order by xtype
--cannot use where with groupby
--thats y we use having

select 
name,xtype,
COUNT(xtype) as CountOfObjects
from sysobjects
group by xtype,name
having xtype='U'
--ways to use where with groupby use into to make a new table and then use where in that table but not a good practice
select 
name,xtype,
COUNT(xtype) as CountOfObjects into t1 
from sysobjects
group by xtype,name
having xtype='U'
--bad practice
go 
select * from t1
--another way
select * from
(select 
xtype,
COUNT(xtype) as CountOfObjects 
from sysobjects
group by xtype) g1 where g1.xtype='u'

--innner join without making new table t2
SELECT t1.xtype, t1.CountOfObjects
FROM t1
INNER JOIN
(
    SELECT DISTINCT xtype
    FROM sysobjects
) t2
ON t1.xtype = t2.xtype
WHERE t1.xtype = 'u';
--without using table t1 by temp storage
SELECT t3.xtype, t3.CountOfObjects
FROM 
(
    select 
name,xtype,
COUNT(xtype) as CountOfObjects 
from sysobjects
group by xtype,name
having xtype='U'
) AS t3
INNER JOIN
(
    SELECT DISTINCT xtype
    FROM sysobjects
) AS t2
ON t3.xtype = t2.xtype
WHERE t3.xtype = 'U';
