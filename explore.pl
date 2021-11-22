nabrak :-
    write('Anda menabrak.'),
    nl,
    write('Ketik \'map\' untuk melihat posisi Anda.'),
    nl.


w :- 
    game_start(true),
    /* battle(0), shop(0), atquest(0), */
    lokasi(player, X, Y),
    YNew is Y-1,
    (\+ lokasi(_, X, YNew)),
    YNew > 0, YNew < 15, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, X, YNew)),
    write('Anda bergeser ke atas.'), !,
    nl,
    map.


a :- 
    game_start(true),
    /* battle(0), shop(0), atquest(0), */
    lokasi(player, X, Y),
    XNew is X-1,
    (\+ lokasi(_, XNew, Y)),
    XNew > 0, XNew < 18, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, XNew, Y)),
    write('Anda bergeser ke kiri.'), !,
    nl,
    map.

s :- 
    game_start(true),
    /* battle(0), shop(0), atquest(0), */
    lokasi(player, X, Y),
    YNew is Y+1,
    (\+ lokasi(_, X, YNew)),
    YNew > 0, YNew < 15, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, X, YNew)),
    write('Anda bergeser ke bawah.'), !,
    nl,
    map.

d :- 
    game_start(true),
    /* battle(0), shop(0), atquest(0), */
    lokasi(player, X, Y),
    XNew is X+1,
    (\+ lokasi(_, XNew, Y)),
    XNew > 0, XNew < 18, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, XNew, Y)),
    write('Anda bergeser ke kanan.'), !,
    nl,
    map.

