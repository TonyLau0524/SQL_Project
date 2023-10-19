select
(
	(select max(length) from (SELECT  length from film order by length limit 500))
+ (select min(length) from (SELECT  length from film order by length desc limit 500))
	)/2 as length_median
