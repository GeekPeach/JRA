create table wk_record_time as select keibajo_code, track_code, kyori, MIN(record_time) as "record_time" from jvd_record_master group by keibajo_code, track_code, kyori order by keibajo_code, track_code, kyori;

