/* Jalan aja */
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

/* Masuk marketplace */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(market, XNew, Y),
    write('Anda memasuki marketplace.'),
    nl,
    retract(atMarketplace(0)),
    asserta(atMarketplace(1)), !,
    nl,
    toMarket.

/* Masuk ranch */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(ranch, XNew, Y),
    write('Anda memasuki ranch.'),
    nl,
    retract(atRanch(0)),
    asserta(atRanch(1)), !,
    nl,
    toRanch.

/* Masuk House */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(house, XNew, Y),
    write('Anda memasuki house.'),
    nl,
    retract(atHouse(0)),
    asserta(atHouse(1)), !,
    nl.

/* Masuk Quest */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(quest, XNew, Y),
    write('Anda memasuki quest.'),
    nl,
    retract(atQuest(0)),
    asserta(atQuest(1)), !,
    nl.

/* Ada Air */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(air, XNew, Y),
    write('You cant get into water.'),!,
    nl.

/* digged Tile */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(digged_tile, XNew, Y),
    XNew > 0, XNew < 18, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, XNew, Y)),
    write('Anda berdiri di atas digged tile.'), !,
    nl,
    map.
/* else: Nabrak */
a :-
    nabrak.