use INDIAN_BANK

select * from AccountMaster
select * from TxnnMaster

--inner join(2 tables) (old)
select *
from AccountMaster, TxnnMaster
where AccountMaster.ACID = TxnnMaster.ACID
--or (new)
select *
from AccountMaster join TxnnMaster
	on AccountMaster.ACID = TxnnMaster.ACID
--or 
select *
from AccountMaster am join TxnnMaster tm
	on am.ACID = tm.ACID
--or
select *
from AccountMaster as am join TxnnMaster as tm
	on am.ACID = tm.ACID

--inner join(3 tables)
select *
from AccountMaster am join TxnnMaster tm
	on am.ACID = tm.ACID
	join PRODUCTMASTER pm
	on pm.PID = am.PID

--outer join(left) matched data + unmatched data
select *
from AccountMaster am left join TxnnMaster tm
on am.ACID = tm.ACID

--outer join(left) only unmatched data
select *
from AccountMaster am left join TxnnMaster tm
	on am.ACID = tm.ACID
	where TNO is null

--outer join(left) only matched data
select *
from AccountMaster am left join TxnnMaster tm
	on am.ACID = tm.ACID
	where TNO is not null

--outer join(left) only unmatched data
--gives ambiguity error for acid as there are two acid colmns
select ACID
from AccountMaster am left join TxnnMaster tm
	on am.ACID = tm.ACID

--outer join(left) only unmatched data
--to avoid ambiguity error for acid
select am.ACID, name
from AccountMaster am left join TxnnMaster tm
	on am.ACID = tm.ACID

--outer join(right)
select *
from AccountMaster am right join TxnnMaster tm
	on am.ACID = tm.ACID

--outer join(full)
select *
from AccountMaster am full join TxnnMaster tm
	on am.ACID = tm.ACID

--
select name, PRODUCTNAME
from AccountMaster as am join PRODUCTMASTER as pm
	on am.PID = pm.PID

--inner join
--Find out Customer name wise, TxnType wise no of txns
select name, TXN_TYPE, count(*) as nooftxns
from AccountMaster as am join TxnnMaster as tm
on am.ACID = tm.ACID
group by name, TXN_TYPE

--Find out Customer name wise, TxnType wise no of txns in last month
select name, TXN_TYPE, count(*) as nooftxns
from AccountMaster as am join TxnnMaster as tm
on am.ACID = tm.ACID
where datediff(mm, dot, getdate()) = 1
group by name, TXN_TYPE

--
select distinct name, PRODUCTNAME
from AccountMaster am join TxnnMaster tm
on am.ACID = tm.ACID
join PRODUCTMASTER as pm 
on pm.PID = am.PID
where TXN_TYPE = 'CD'
--use distinct to remove duplicates

--cross join
select *
from AccountMaster, TxnnMaster
--or
select *
from AccountMaster cross join TxnnMaster

--self join can have inner join or outer join
