#/bin/sh

ddir="/home/ec2-user/dev/JRA/data"

#psql -h pckeiba2.civkqfk3e4wj.ap-northeast-1.rds.amazonaws.com --username=postgres --dbname=pckeiba -f mk_wk_record_time.sql
ddir="/home/grass/JRA/data"

#psql pckeiba -U postgres -f mk_wk_record_time.sql

function bestTime() 
{ 
local race_date=$1
local race_course=$2
local race_bango=$3
local TD=$4
local tDist=$5
psql -h pckeiba2.civkqfk3e4wj.ap-northeast-1.rds.amazonaws.com --username=postgres --dbname=pckeiba -A -F"	" << EOT

drop table wk_bestTime;
create table wk_bestTime as 
select 
-- bamei as "bamei",
 ketto_toroku_bango,
 case when r.track_code in('11','12','13','14','15','16','17',
            '18','19','20','21','22') then 'T'
  when r.track_code in('23','24','25','26','27','28','29') then 'D'
  else 'O' end as "td" ,
  kakutei_chakujun as "chakujun",
 soha_time as "time",
 l.kohan_3f as "agari_time",
 r.kyori as "kyori"
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
 kyori = '${tDist}'
;
EOT

psql -h pckeiba2.civkqfk3e4wj.ap-northeast-1.rds.amazonaws.com --username=postgres --dbname=pckeiba -t -A -F"	" << _EOT2 > ${ddir}/tmp_${tDist}.tsv

select 
 l.ketto_toroku_bango
 ,MIN(time) as "bestTime"
 ,STDDEV_POP(time)
 ,AVG(time)
 ,MIN(agari_time)
 ,STDDEV_POP(agari_time)
 ,AVG(agari_time)
from jvd_umagoto_race_joho l 
left outer join wk_bestTime r 
on 
 l.ketto_toroku_bango = r.ketto_toroku_bango
 and kyori = '${tDist}'
where 
 l.ketto_toroku_bango in (
 select ketto_toroku_bango from 
 jvd_umagoto_race_joho 
 where 
 kaisai_nengappi = '${race_date}' AND 
 keibajo_code = '${race_course}' AND 
 race_bango = ${race_bango}
)
 AND td = '${TD}'
group by l.ketto_toroku_bango
order by l.ketto_toroku_bango
;
_EOT2

}

bestTime $@
bestTime $1 $2 $3 $4 `expr $5 - 200`
bestTime $1 $2 $3 $4 `expr $5 + 200`
bestTime $1 $2 $3 $4 `expr $5 - 400`
bestTime $1 $2 $3 $4 `expr $5 + 400` 

