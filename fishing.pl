fish :-
    equipment('fishing Rod', _, 0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, use your fishing rod first!        |'),nl,
    write('|----------------------------------------------------|'),nl
    .


fish :- 
    equipment('fishing Rod', _, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    W is Y-1,
    lokasi(air, X, W), !,
    write('sukses mancing w'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('fishing Rod', _, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    A is X-1,
    lokasi(air, A, Y), !,
    write('sukses mancing a'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('fishing Rod', _, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    S is Y+1,
    lokasi(air, X, S), !,
    write('sukses mancing s'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('fishing Rod', _, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    D is X+1,
    lokasi(air, D, Y), !,
    write('sukses mancing d'), nl.
    /*
    gacha disini
    */


fish :-
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, You are at House right now ._.     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

fish :-
    atRanch(0), atMarketplace(0), atQuest(1), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, You are at Quest right now ._.     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

fish :-
    atRanch(0), atMarketplace(1), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|  Can\'t fish, You are at Marketplace right now ._.  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

fish :-
    atRanch(1), atMarketplace(0), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, You are at Ranch right now ._.     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

fish :-
    write('|----------------------------------------------------|'),nl,
    write('|      Can\'t fish, stand near water first! ^_^       |'),nl,
    write('|----------------------------------------------------|'),nl
    .