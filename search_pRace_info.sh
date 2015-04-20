#/bin/sh

race_date=$1
race_course=$2
race_bango=$3

psql pckeiba -U postgres -t -A -F"	" << EOT

select 
 ketto_toroku_bango,
 bamei,
 kakutei_chakujun,
 wakuban,
 umaban,
 bataiju,
 zogen_fugo||zogen_sa as bataiju_zogen  
from jvd_umagoto_race_joho 
where 
 kaisai_nengappi = '${race_date}' AND
 keibajo_code = '${race_course}' AND
 race_bango = ${race_bango}
order by
 ketto_toroku_bango
;
EOT

