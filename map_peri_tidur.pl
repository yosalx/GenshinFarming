map_peri_tidur :-
    game_start(true), !,
    draw_map_peri_tidur.

/* Tembok Kiri */
gambar_peri_tidur(A,B) :-
    A =:= 0,
    B =< 15,
    write('# '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Tembok atas */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B =:= 0,
    write('# '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Tembok kanan */
gambar_peri_tidur(A,B) :-
    A =:= 18,
    B =< 15,
    write(B), write(' \n'),
    A1 is 0,
    B1 is B+1,
    gambar_peri_tidur(A1,B1).

/* Tembok bawah */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B =:= 15,
    Anew is mod(A,10),
    write(Anew), write(' '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).


/* Player */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(player,A,B), !,
    write('P '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Block */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(air,A,B), !,
    write('o '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Quest */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(quest,A,B), !,
    write('Q '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* House */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(house,A,B), !,
    write('H '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Ranch */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(ranch,A,B), !,
    write('R '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Market */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(market,A,B), !,
    write('M '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Map kosong */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    (\+ lokasi_farm(_,A,B,_)),
    (\+ lokasi(_,A,B)),
    write('- '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Digged Tile */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    (\+ lokasi(player,A,B)),
    lokasi(digged_tile,A,B), !,
    write('= '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).


/* FARMING GAN */

/* Wortel */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    wortel_time(Time),
    lokasi_farm(wortel,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('w '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    wortel_time(Time),
    lokasi_farm(wortel,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('W '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).



/* Tomat */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    tomat_time(Time),
    lokasi_farm(tomat,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('t '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    tomat_time(Time),
    lokasi_farm(tomat,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('T '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Kentang */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    kentang_time(Time),
    lokasi_farm(kentang,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('k '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    kentang_time(Time),
    lokasi_farm(kentang,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('K '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Stroberi */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    stroberi_time(Time),
    lokasi_farm(stroberi,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('s '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    stroberi_time(Time),
    lokasi_farm(stroberi,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('S '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

/* Jagung */
gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    jagung_time(Time),
    lokasi_farm(jagung,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('j '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).

gambar_peri_tidur(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    jagung_time(Time),
    lokasi_farm(jagung,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('J '),
    A1 is A+1,
    gambar_peri_tidur(A1,B).



draw_map_peri_tidur :-
    gambar_peri_tidur(0,0).