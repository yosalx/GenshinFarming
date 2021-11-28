/* Jalan Aja */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    (\+ lokasi(_, X, YNew)),
    YNew > 0, YNew < 15, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, X, YNew)),
    write('Anda bergeser ke atas.'), !,
    nl,
    map.

/* Masuk marketplace */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    lokasi(market, X, YNew),
    write('Anda memasuki marketplace.'),
    nl,
    retract(atMarketplace(0)),
    asserta(atMarketplace(1)), !,
    nl,
    toMarket.

/* udah di marketplace */
w :-
    game_start(true),
    atMarketplace(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the market right now,          |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .


/* Masuk ranch */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    lokasi(ranch, X, YNew),
    write('Anda memasuki ranch.'),
    nl,
    retract(atRanch(0)),
    asserta(atRanch(1)), !,
    nl,
    toRanch.

/* udah di ranch */
w :-
    game_start(true),
    atRanch(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the ranch right now,           |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .


/* Masuk House */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    lokasi(house, X, YNew),
    write('Anda memasuki house.'),
    nl,
    retract(atHouse(0)),
    asserta(atHouse(1)), !,
    nl.

/* udah di house */
w :-
    game_start(true),
    atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the house right now,           |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Masuk Quest */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    lokasi(quest, X, YNew),
    write('Anda memasuki quest.'),
    nl,
    retract(atQuest(0)),
    asserta(atQuest(1)), !,
    nl.

/* udah di Quest */
w :-
    game_start(true),
    atQuest(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|         You are at the Quest room right now,       |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Ada Air */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    lokasi(air, X, YNew),
    air,!,
    nl.

/* Digged Tile */
w :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y-1,
    lokasi(digged_tile, X, YNew),
    YNew > 0, YNew < 15, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, X, YNew)),
    write('Anda berdiri di atas digged tile.'), !,
    nl,
    map.
/* else: Nabrak */
w :-
    nabrak.