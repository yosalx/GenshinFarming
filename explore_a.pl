/* Jalan aja */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    (\+ lokasi(_, XNew, Y)),
    XNew > 0, XNew < 18, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, XNew, Y)),
    write('|-----------------------|'),nl, !,
    write('| You moved to the left.|'),nl,
    write('|-----------------------|'), nl,
    write('|       .               |'),nl,
    write('|     .;;............   |'),nl,
    write('|   .;;;;::::::::::::   |'),nl,
    write('|    \':;;::::::::::::   |'),nl,
    write('|      \':               |'),nl,
    write('|-----------------------|'),nl.

/* Masuk marketplace */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(market, XNew, Y),
    retract(atMarketplace(0)),
    asserta(atMarketplace(1)), !,
    nl,
    toMarket.

/* udah di marketplace */
a :-
    game_start(true),
    atMarketplace(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the market right now,          |'),nl,
    write('|                    can\'t move :c                   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Masuk ranch */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(ranch, XNew, Y),
    retract(atRanch(0)),
    asserta(atRanch(1)), !,
    nl,
    toRanch.

/* udah di ranch */
a :-
    game_start(true),
    atRanch(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the ranch right now,           |'),nl,
    write('|                    can\'t move :c                   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Masuk House */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(house, XNew, Y),
    nl,
    retract(atHouse(0)),
    asserta(atHouse(1)), !,
    nl, house.

a :-
    game_start(true),
    atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the house right now,           |'),nl,
    write('|                    can\'t move :c                   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

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

/* udah di Quest */
a :-
    game_start(true),
    atQuest(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|         You are at the Quest room right now,       |'),nl,
    write('|                    can\'t move :c                   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Ada Air */
a :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    XNew is X-1,
    lokasi(air, XNew, Y),
    air,!,
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
    write('|---------------------------------- |'), nl, !,
    write('| You are standing on a digged tile |'), nl,
    write('|-----------------------------------|'), nl,
    map.
/* else: Nabrak */
a :-
    nabrak.