use software_schema;

select * from software;

select count(*) from software;

select count(package) from software;

select count(package) from software
where package = "Rcpp";

select count(country) from software
where country = "CN";

select package,count(*) as downloaded from software
group by package
order by 2 desc;

select package, count(*) from software
where substr(time, 1, 5) < "11:00" 
and substr(time, 1, 5) > "09:00"
group by package 
order by 2 desc;

select count(country) from software
where country in ("CN","JP","SG");

select country from (select country, count(*) as downloads from software
group by country ) as a  
where downloads > (select count(*) from software where country = 'CN');

select avg (length(packages)) 
from(select distinct package as packages from software)a;

select temp.a package, temp.b count from 
(select package a, count(*) b  from software
group by package
order by b desc limit 2) temp 
order by temp.b asc
limit 1;


select package from software
group by package
having count(*) > 1000;

/*  9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage). */