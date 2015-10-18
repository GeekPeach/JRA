race=$1
psql -h pckeiba2.civkqfk3e4wj.ap-northeast-1.rds.amazonaws.com --username=postgres --dbname=pckeiba << EOT

select
 kyosomei_hondai,
 kaisai_nengappi,
 keibajo_code,
 race_bango 
from
 jvd_race_shosai 
where
 kyosomei_hondai like '%${race}%' --AND
-- kaisai_nengappi < '2000-01-01 00:00:00' 
order by kaisai_nengappi DESC 
limit 7;
EOT
