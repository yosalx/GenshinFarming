fish :-
    equipment('fishing Rod', _, 0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, use your fishing rod first!        |'),nl,
    write('|----------------------------------------------------|'),nl
    .


fish :- 
    equipment('fishing Rod', Level, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    W is Y-1,
    lokasi(air, X, W), !,
    write('sukses mancing w'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('fishing Rod', Level, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    A is X-1,
    lokasi(air, A, Y), !,
    write('sukses mancing a'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('fishing Rod', Level, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    S is Y+1,
    lokasi(air, X, S), !,
    write('sukses mancing s'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('fishing Rod', Level, 1),
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


gacha(LevelFishing) :-
    subgacha(LevelFishing).

subgacha(1) :-
    random(1, 101, R),
    subsubgacha1(R, Hasil).
    printHasil(Hasil).

subgacha(2) :-
    random(1, 101, R),
    subsubgacha2(R, Hasil),
    printHasil(Hasil).

subgacha(3) :-
    random(1, 101, R),
    subsubgacha2(3, Hasil),
    printHasil(Hasil).

/* hasil gacha buat level 1 exp fishing*/
subsubgacha1(R, Hasil) :-
    R == 1, 
    Hasil is Tuna.
subsubgacha1(R, Hasil) :-
    R>1, R<7, 
    Hasil is Salmon.
subsubgacha1(R, Hasil) :-
    R>6, R<21, 
    Hasil is Gurame.
subsubgacha1(R, Hasil) :-
    R>20, R<41, 
    Hasil is Tongkol.
subsubgacha1(R, Hasil) :-
    R>40, R<71, 
    Hasil is Lele.
subsubgacha1(R, Hasil) :-
    R>70, R<101, 
    Hasil is Garbage.


printHasil(Hasil) :-
    Hasil == Tuna,
    addItem('Tuna', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Tuna (Rank S)        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil == Salmon,
    addItem('Salmon', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Salmon (Rank A)      |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil == Gurame,
    addItem('Gurame', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Gurame (Rank B)      |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil == Tongkol,
    addItem('Tongkol', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Tongkol (Rank C)     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil == Lele,
    addItem('Lele', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Lele (Rank D)        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil == Garbage,
    write('|----------------------------------------------------|'),nl,
    write('|      Sorry, You got nothing. Keep fishing! ^_^     |'),nl,
    write('|----------------------------------------------------|'),nl
    .