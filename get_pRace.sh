#/bin/sh
ddir="/home/grass/JRA/data"

rm ../data/pr*.tsv

TD='T'
tDist=1600
tm1FDist=`expr ${tDist} - 200`
tp1FDist=`expr ${tDist} + 200`
tm2FDist=`expr ${tDist} - 400`
tp2FDist=`expr ${tDist} + 400`

#1year ago
date="2014-04-13"
keibajo="09"
race=11
sh search_horse_info.sh ${date} ${keibajo} ${race} > ../data/tmp_horse_info.tsv
sh search_pRace_info.sh ${date} ${keibajo} ${race} > ../data/tmp_target.tsv
ruby sorted_row_join.rb ../data/tmp_horse_info.tsv > ../data/tmp_joined_rinfo.tsv
sh get_bestTime.sh ${date} ${keibajo} ${race} ${TD} ${tDist}
sh get_konkan.sh ${date} ${keibajo} ${race} ${TD}

join -a1 -t"$(printf '\011')" ../data/tmp_target.tsv ../data/tmp_joined_rinfo.tsv | cut -f1-17,19-28,30-39 | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_konkan.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_hikonkan.tsv > ${ddir}/pr1.tsv

#2yarr ago
date="2013-04-07"
keibajo="09"
race=11
sh search_horse_info.sh ${date} ${keibajo} ${race} > ../data/tmp_horse_info.tsv
sh search_pRace_info.sh ${date} ${keibajo} ${race} > ../data/tmp_target.tsv
ruby sorted_row_join.rb ../data/tmp_horse_info.tsv > ../data/tmp_joined_rinfo.tsv
sh get_bestTime.sh ${date} ${keibajo} ${race} ${TD} ${tDist}
sh get_konkan.sh ${date} ${keibajo} ${race} ${TD}

join -a1 -t"$(printf '\011')" ../data/tmp_target.tsv ../data/tmp_joined_rinfo.tsv | cut -f1-17,19-28,30-39 | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_konkan.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_hikonkan.tsv > ${ddir}/pr2.tsv

#3years ago
date="2012-04-08"
keibajo="09"
race=11
sh search_horse_info.sh ${date} ${keibajo} ${race} > ../data/tmp_horse_info.tsv
sh search_pRace_info.sh ${date} ${keibajo} ${race} > ../data/tmp_target.tsv
ruby sorted_row_join.rb ../data/tmp_horse_info.tsv > ../data/tmp_joined_rinfo.tsv
sh get_bestTime.sh ${date} ${keibajo} ${race} ${TD} ${tDist}
sh get_konkan.sh ${date} ${keibajo} ${race} ${TD}

join -a1 -t"$(printf '\011')" ../data/tmp_target.tsv ../data/tmp_joined_rinfo.tsv | cut -f1-17,19-28,30-39 | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_konkan.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_hikonkan.tsv > ${ddir}/pr3.tsv



#4years ago
date="2011-04-10"
keibajo="09"
race=11
sh search_horse_info.sh ${date} ${keibajo} ${race} > ../data/tmp_horse_info.tsv
sh search_pRace_info.sh ${date} ${keibajo} ${race} > ../data/tmp_target.tsv
ruby sorted_row_join.rb ../data/tmp_horse_info.tsv > ../data/tmp_joined_rinfo.tsv
sh get_bestTime.sh ${date} ${keibajo} ${race} ${TD} ${tDist}
sh get_konkan.sh ${date} ${keibajo} ${race} ${TD}

join -a1 -t"$(printf '\011')" ../data/tmp_target.tsv ../data/tmp_joined_rinfo.tsv | cut -f1-17,19-28,30-39 | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_konkan.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_hikonkan.tsv > ${ddir}/pr4.tsv

#5years ago
date="2010-04-11"
keibajo="09"
race=10
sh search_horse_info.sh ${date} ${keibajo} ${race} > ../data/tmp_horse_info.tsv
sh search_pRace_info.sh ${date} ${keibajo} ${race} > ../data/tmp_target.tsv
ruby sorted_row_join.rb ../data/tmp_horse_info.tsv > ../data/tmp_joined_rinfo.tsv
sh get_bestTime.sh ${date} ${keibajo} ${race} ${TD} ${tDist}
sh get_konkan.sh ${date} ${keibajo} ${race} ${TD}

join -a1 -t"$(printf '\011')" ../data/tmp_target.tsv ../data/tmp_joined_rinfo.tsv | cut -f1-17,19-28,30-39 | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp1FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tm2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_${tp2FDist}.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_konkan.tsv | join -a1 -t"$(printf '\011')" - ${ddir}/tmp_hikonkan.tsv > ${ddir}/pr5.tsv


cat ../data/pr?.tsv > ../data/pr.tsv

