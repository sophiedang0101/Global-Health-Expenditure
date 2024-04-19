-- ENCOUNTERS TABLE QUERIES.

select * 
from 
	public.encounters
	

-- retrieves rows where encounter class is inpatient and description is
-- ICU Admission and the stop is between 2023/01/01 and 2023/12/31.
	
select *
from 
	public.encounters
where 
	encounterclass = 'inpatient'
	and description = 'ICU Admission'
	and stop >= '2023-01-01 00:00'
	and stop <= '2023-12-31 23:59'


-- same result as above query, but uses 'between' instead of 'and'.
	
select *
from 
	public.encounters
where 
	encounterclass = 'inpatient'
	and description = 'ICU Admission'
	and stop between '2023-01-01 00:00' and '2023-12-31 23:59'


-- retrieves rows where the encounterclass is ambulatory OR outpatient.
	
select *
from 
	public.encounters
where 
	encounterclass = 'outpatient' or encounterclass = 'ambulatory'
	

-- same result as above query but using 'in' instead of 'or' to retrieve records.

select *
from 
	public.encounters
where 
	encounterclass in ('outpatient','ambulatory')


-- CONDITIONS TABLE QUERIES.
	
select * 
from 
	public.conditions


-- Group different conditions together and get the number of times each condition occurred.

select description,
   count(*) as ct_of_condition
from 
	public.conditions
group by
	description
having 
	count(*) > 2000
order by
	count(*) desc


-- Using the 'WHERE' clause to filter out a specific condition 
-- together with 'GROUP BY' and 'HAVING' clauses.
	
select description,
   count(*) as ct_of_condition
from 
	public.conditions
where 
	description != 'Body Mass Index 30.0-30.9, adult'
group by
	description
having 
	count(*) > 2000
order by
	count(*) desc



-- PRACTICE QUERIES.

select *
from 
	public.conditions
where
	code in ('585.1', '585.2', '585.3', '585.4')


/* Query retrieves the count of all patients from their city of residence.
   and there must have been at least 100 patients
   cities don't include Boston.*/
	
select city,
   count(*) as num_of_patients
from
	public.patients
where
	city != 'Boston'
group by
	city
having 
	count(*) >= 100
order by 
	count(*) desc

	

-- Left join using the immunizations and patients tables on patient id.
select t1. *,
	t2.first,
	t2.last,
	t2.birthdate
from
	public.immunizations as t1
left join 
	public.patients as t2
on
	t1.patient = t2.id






