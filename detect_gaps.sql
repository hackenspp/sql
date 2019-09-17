select 
	id + 1 as gap_start,
	next_id - 1 as gap_end
from (
  select 
  	id::int, 
	lead(id::int) over (order by id::int) as next_id
  from regexp_split_to_table('1,2,3,10,11,12,20,21,22', ',') id
) nr
where id + 1 <> next_id;
