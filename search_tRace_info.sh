#/bin/sh

race_date=$1
race_course=$2
race_bango=$3

psql pckeiba -U postgres -t -A -F"	" << EOT

select 
 l.ketto_toroku_bango,
 l.bamei,
 l.kakutei_chakujun,
 l.wakuban,
 l.umaban, 
 r.bataiju,
 r.zogen_fugo||r.zogen_sa as bataiju_zogen  
from jvd_umagoto_race_joho l 
left join jvd_bataiju r 
on 
 l.kaisai_nengappi = r.kaisai_nengappi AND 
 l.keibajo_code = r.keibajo_code AND 
 l.race_bango = r.race_bango AND 
 l.umaban = r.umaban
where 
 l.kaisai_nengappi = '${race_date}' AND
 l.keibajo_code = '${race_course}' AND
 l.race_bango = ${race_bango}  
order by
 l.ketto_toroku_bango
;
EOT

