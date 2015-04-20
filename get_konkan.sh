#/bin/sh

ddir="/home/grass/JRA/data"


function konkan() 
{ 
local race_date=$1
local race_course=$2
local race_bango=$3
local TD=$4
local eq=""
if [ $5 = "konkan" ]
then
  eq="="
else
  eq="!="
fi

psql pckeiba -U postgres -A -F"	" << EOT

drop table wk_konkan;

create table wk_konkan as 
select 
-- bamei as "bamei",
 ketto_toroku_bango,
  case when r.track_code in('11','12','13','14','15','16','17',
            '18','19','20','21','22') then 'T'
  when r.track_code in('23','24','25','26','27','28','29') then 'D'
  else 'O' end as "td" ,
  kakutei_chakujun as "chakujun",
 soha_time as "time",
 l.kohan_3f as "agari_time"
from jvd_umagoto_race_joho l 
left outer join jvd_race_shosai r 
on 
 l.kaisai_nengappi = r.kaisai_nengappi AND
 l.race_bango = r.race_bango AND
 l.keibajo_code = r.keibajo_code 
where 
 l.ketto_toroku_bango in
(select
 ketto_toroku_bango 
from
 jvd_umagoto_race_joho 
where
 kaisai_nengappi = '${race_date}' AND 
 keibajo_code = '${race_course}' AND 
 race_bango = ${race_bango}
) AND 
 l.kaisai_nengappi < '${race_date}' AND
 kakutei_chakujun > 0 AND
 kyori % 400 ${eq} 0  
;
EOT

psql pckeiba -U postgres -t -A -F"	" << EOT2 > ${ddir}/tmp_${5}.tsv
select 
 ketto_toroku_bango as ketto_bango
,SUM(case when chakujun <= 2 then 1 else 0 end) / cast (count(chakujun) as float4)  as rentairitsu
,AVG(chakujun) as avg_chakujun
 from wk_konkan  
where TD = '${TD}'  
group by ketto_toroku_bango
order by ketto_toroku_bango
;
EOT2

return 0
}

konkan $@ "hikonkan"
konkan $@ "konkan"

