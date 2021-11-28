
/* Jalan aja */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    (\+ lokasi(_, X, YNew)),
    YNew > 0, YNew < 15, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, X, YNew)),
    write('|-------------------|'),nl,
    write('|You moved downward.|'),nl,
    write('|-------------------|'),nl,
    write('|       ;;;;;       |'),nl,
    write('|       ;;;;;       |'),nl,
    write('|       ;;;;;       |'),nl,
    write('|       ;;;;;       |'),nl,
    write('|     ..;;;;;..     |'),nl,
    write('|      \':::::\'      |'),nl,
    write('|        \':`        |'),nl,
    write('|-------------------|'),nl.

/* Masuk marketplace */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    lokasi(market, X, YNew),
    retract(atMarketplace(0)),
    asserta(atMarketplace(1)), !,
    nl,
    toMarket.

/* udah di marketplace */
s :-
    game_start(true),
    atMarketplace(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the market right now,          |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .


/* Masuk ranch */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    lokasi(ranch, X, YNew),
    retract(atRanch(0)),
    asserta(atRanch(1)), !,
    nl,
    toRanch.

/* udah di ranch */
s :-
    game_start(true),
    atRanch(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the ranch right now,           |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Masuk House */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    lokasi(house, X, YNew),
    write('Anda memasuki house.'),
    nl,
    retract(atHouse(0)),
    asserta(atHouse(1)), !,
    nl.

/* udah di house */
s :-
    game_start(true),
    atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|          You are at the house right now,           |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Masuk Quest */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    lokasi(quest, X, YNew),
    write('Anda memasuki quest.'),
    nl,
    retract(atQuest(0)),
    asserta(atQuest(1)), !,
    nl.

/* udah di Quest */
s :-
    game_start(true),
    atQuest(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|         You are at the Quest room right now,       |'),nl,
    write('|                     can\'t move :c                  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* Ada air */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    lokasi(air, X, YNew),
    air,!,
    nl.

/* Digged Tile */
s :- 
    game_start(true),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0), 
    lokasi(player, X, Y),
    YNew is Y+1,
    lokasi(digged_tile, X, YNew),
    YNew > 0, YNew < 15, !,
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, X, YNew)),
    write('|---------------------------------- |'), nl, !,
    write('| You are standing on a digged tile |'), nl,
    write('|-----------------------------------|'), nl,
    map.

/* else: Nabrak */
s :-
    nabrak.