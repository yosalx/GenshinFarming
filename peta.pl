wortel_time(5).
tomat_time(5).
jagung_time(5).
stroberi_time(5).
kentang_time(5).

peta :-
    asserta(lokasi(player,8,7)),
    asserta(lokasi(quest,7,3)),
    asserta(lokasi(house,7,6)),
    asserta(lokasi(ranch,10,5)),
    asserta(lokasi(market,10,12)),

    asserta(lokasi(air,5,8)),
    asserta(lokasi(air,6,8)),
    asserta(lokasi(air,7,8)),

    asserta(lokasi(air,4,9)),
    asserta(lokasi(air,5,9)),
    asserta(lokasi(air,6,9)),
    asserta(lokasi(air,7,9)),
    asserta(lokasi(air,8,9)),

    asserta(lokasi(air,5,10)),
    asserta(lokasi(air,6,10)),
    asserta(lokasi(air,7,10)),
    
    asserta(lokasi(digged_tile,10,10)).



