select * from jvd_umagoto_race_joho where ketto_toroku_bango in (
select ketto_toroku_bango from jvd_umagoto_race_joho where keibajo_code = '06' AND kaisai_nengappi = '2014-12-28 00:00:00' AND race_bango = '10');
--select ketto_toroku_bango from jvd_umagoto_race_joho where keibajo_code = '06' AND kaisai_nengappi = '2014-12-28 00:00:00' AND race_bango = '10';

