#/bin/sh

race_date=$1
race_course=$2
race_bango=$3

psql pckeiba -U postgres -t -A -F"	" << EOT

select 
 ketto_toroku_bango,
--bamei,
 l.keibajo_code,
-- l.kaisai_nengappi,
-- l.race_bango,
-- r.kyosomei_hondai,
 r.grade_code,
 r.kyori,
 r.track_code,
 kakutei_chakujun,
 --barei,
 bataiju,
 zogen_fugo||zogen_sa,
 soha_time,
 time_sa,
 l.kohan_3f 
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
 kakutei_chakujun > 0
order by ketto_toroku_bango, l.kaisai_nengappi DESC
;
EOT
