#/bin/sh

ddir="/home/ec2-user/dev/JRA/data"

psql -h pckeiba2.civkqfk3e4wj.ap-northeast-1.rds.amazonaws.com --username=postgres --dbname=pckeiba -f mk_wk_record_time.sql
ddir="/home/grass/JRA/data"

function bestTime() 
{ 
local race_date=$1
local race_course=$2
local race_bango=$3
local TD=$4
local tDist=$5
psql -h pckeiba2.civkqfk3e4wj.ap-northeast-1.rds.amazonaws.com --username=postgres --dbname=pckeiba -A -F"	" << EOT > /dev/null

create table wk_time_diff as 
select 
-- bamei as "bamei",
 ketto_toroku_bango,
 r.kyori as "kyori",
 track_code ,
 soha_time as "time",
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
left out join wk_record_time rec
on
 l.keibajo_code = '${race_course}' and
 kyori = rec.kyori
 trace_code = rec.track_code
;
EOT
}

bestTime $@
