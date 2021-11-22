:- dynamic(lokasi/3).
:- dynamic(lokasi_farm/4).

start :-
    asserta(game_start(true)),
    [peta],
    [explore],
    peta.

map :-
    game_start(true), !,
    draw_map.


/* Tembok Kiri */
gambar(A,B) :-
    A =:= 0,
    B =< 15,
    write('#'),
    A1 is A+1,
    gambar(A1,B).

/* Tembok atas */
gambar(A,B) :-
    A > 0,
    A < 18,
    B =:= 0,
    write('#'),
    A1 is A+1,
    gambar(A1,B).

/* Tembok kanan */
gambar(A,B) :-
    A =:= 18,
    B =< 15,
    write('#\n'),
    A1 is 0,
    B1 is B+1,
    gambar(A1,B1).

/* Tembok bawah */
gambar(A,B) :-
    A > 0,
    A < 18,
    B =:= 15,
    write('#'),
    A1 is A+1,
    gambar(A1,B).


/* Player */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(player,A,B), !,
    write('P'),
    A1 is A+1,
    gambar(A1,B).

/* Block */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(air,A,B), !,
    write('o'),
    A1 is A+1,
    gambar(A1,B).

/* Quest */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(quest,A,B), !,
    write('Q'),
    A1 is A+1,
    gambar(A1,B).

/* House */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(house,A,B), !,
    write('H'),
    A1 is A+1,
    gambar(A1,B).

/* Ranch */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(ranch,A,B), !,
    write('R'),
    A1 is A+1,
    gambar(A1,B).

/* Market */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    lokasi(market,A,B), !,
    write('M'),
    A1 is A+1,
    gambar(A1,B).

/* Map kosong */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    (\+ lokasi_farm(_,A,B,_)),
    (\+ lokasi(_,A,B)),
    write('-'),
    A1 is A+1,
    gambar(A1,B).

/* Digged Tile */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    (\+ lokasi(player,A,B)),
    lokasi(digged_tile,A,B), !,
    write('='),
    A1 is A+1,
    gambar(A1,B).


/* FARMING GAN */

/* Wortel */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    wortel_time(Time),
    lokasi_farm(wortel,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('w'),
    A1 is A+1,
    gambar(A1,B).

gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    wortel_time(Time),
    lokasi_farm(wortel,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('W'),
    A1 is A+1,
    gambar(A1,B).



/* Tomat */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    tomat_time(Time),
    lokasi_farm(tomat,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('t'),
    A1 is A+1,
    gambar(A1,B).

gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    tomat_time(Time),
    lokasi_farm(tomat,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('T'),
    A1 is A+1,
    gambar(A1,B).

/* Kentang */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    kentang_time(Time),
    lokasi_farm(kentang,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('k'),
    A1 is A+1,
    gambar(A1,B).

gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    kentang_time(Time),
    lokasi_farm(kentang,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('K'),
    A1 is A+1,
    gambar(A1,B).



/* Stroberi */
gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    stroberi_time(Time),
    lokasi_farm(stroberi,A,B,Age),
    (\+ lokasi(player,A,B)),
    Age < Time, !,
    write('s'),
    A1 is A+1,
    gambar(A1,B).

gambar(A,B) :-
    A > 0,
    A < 18,
    B > 0,
    B < 15,
    stroberi_time(Time),
    lokasi_farm(stroberi,A,B,Age),
    (\+ lokasi(player,A,B)),
    Time =< Age, !,
    write('S'),
    A1 is A+1,
    gambar(A1,B).


draw_map :-
    gambar(0,0).