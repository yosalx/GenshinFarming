wortel_time(5).
tomat_time(5).
jagung_time(5).
stroberi_time(5).
kentang_time(5).

load_peta :-
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
    
    asserta(lokasi(digged_tile,10,10)),

    asserta(lokasi_farm(wortel,4,6,6)),
    asserta(lokasi_farm(tomat,11,14,4)),
    asserta(lokasi_farm(jagung,4,11,4)),
    asserta(lokasi_farm(stroberi,5,6,4)),
    asserta(lokasi_farm(kentang,10,13,9)),
    asserta(lokasi_farm(wortel,13,10,4)),
    asserta(lokasi_farm(kentang,12,5,4)).



