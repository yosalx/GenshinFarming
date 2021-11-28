:- include('item.pl').

fish :-
    equipment('Fishing Rod', _, 0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, use your fishing rod first!        |'),nl,
    write('|----------------------------------------------------|'),nl
    .


fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    W is Y-1,
    lokasi(air, X, W), !,
    gacha(1, A),
    write('sukses mancing w'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    A is X-1,
    lokasi(air, A, Y), !,
    gacha(1, A),
    write('sukses mancing a'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    S is Y+1,
    lokasi(air, X, S), !,
    gacha(1, A),
    write('sukses mancing s'), nl.
    /*
    gacha disini
    */

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    D is X+1,
    lokasi(air, D, Y), !,
    gacha(1, A),
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


gacha(LevelFishing, LevelFishingRod) :-
    subgacha(LevelFishing, LevelFishingRod), !.

subgacha(1, 1) :-
    random(1, 101, R11),
    subsubgacha1(R11, Hasil11).
    printHasil(Hasil11).

subgacha(2, 1) :-
    random(1, 101, R21),
    subsubgacha2(R21, Hasil21),
    printHasil(Hasil21).

subgacha(3, 1) :-
    random(1, 101, R31),
    subsubgacha3(R31, Hasil31),
    printHasil(Hasil31).

subgacha(1, 2) :-
    random(1, 101, R12),
    subsubgacha4(R12, Hasil12).
    printHasil(Hasil12).

subgacha(2, 2) :-
    random(1, 101, R22),
    subsubgacha5(R22, Hasil22),
    printHasil(Hasil22).

subgacha(3, 2) :-
    random(1, 101, R32),
    subsubgacha6(R32, Hasil32),
    printHasil(Hasil32).

/* hasil gacha buat level 1 exp fishing dengan fishing rod level 1 */ 
subsubgacha1(R, Hasil) :-
    R is 1, 
    Hasil is Tuna,!.
subsubgacha1(R, Hasil) :-
    R>1, R<7, 
    Hasil is Salmon,!.
subsubgacha1(R, Hasil) :-
    R>6, R<21, 
    Hasil is Gurame,!.
subsubgacha1(R, Hasil) :-
    R>20, R<41, 
    Hasil is Tongkol,!.
subsubgacha1(R, Hasil) :-
    R>40, R<71, 
    Hasil is Lele,!.
subsubgacha1(R, Hasil) :-
    R>70, R<101, 
    Hasil is Garbage,!.

/* hasil gacha buat level 2 exp fishing dengan fishing rod level 1 */
subsubgacha2(R, Hasil) :-
    R > 0, R < 6,
    Hasil is Tuna,!.
subsubgacha2(R, Hasil) :-
    R>5, R<16, 
    Hasil is Salmon,!.
subsubgacha2(R, Hasil) :-
    R>15, R<31, 
    Hasil is Gurame,!.
subsubgacha2(R, Hasil) :-
    R>30, R<61, 
    Hasil is Tongkol,!.
subsubgacha2(R, Hasil) :-
    R>60, R<81, 
    Hasil is Lele,!.
subsubgacha2(R, Hasil) :-
    R>80, R<101, 
    Hasil is Garbage,!.

/* hasil gacha buat level 3 exp fishing dengan fishing rod level 1 */
subsubgacha3(R, Hasil) :-
    R>0, R<11, 
    Hasil is Tuna,!.
subsubgacha3(R, Hasil) :-
    R>10, R<24, 
    Hasil is Salmon,!.
subsubgacha3(R, Hasil) :-
    R>23, R<44, 
    Hasil is Gurame,!.
subsubgacha3(R, Hasil) :-
    R>43, R<79, 
    Hasil is Tongkol,!.
subsubgacha3(R, Hasil) :-
    R>78, R<91, 
    Hasil is Lele,!.
subsubgacha3(R, Hasil) :-
    R>90, R<101, 
    Hasil is Garbage,!.

/* hasil gacha buat level 1 exp fishing dengan fishing rod level 2 */
subsubgacha4(R, Hasil) :-
    R>1, R<3, 
    Hasil is Tuna,!.
subsubgacha4(R, Hasil) :-
    R>2, R<9, 
    Hasil is Salmon, !.
subsubgacha4(R, Hasil) :-
    R>8, R<21, 
    Hasil is Gurame, !.
subsubgacha4(R, Hasil) :-
    R>20, R<41, 
    Hasil is Tongkol, !.
subsubgacha4(R, Hasil) :-
    R>40, R<71, 
    Hasil is Lele,!.
subsubgacha4(R, Hasil) :-
    R>70, R<101, 
    Hasil is Garbage, !.

/* hasil gacha buat level 2 exp fishing dengan fishing rod level 2 */
subsubgacha5(R, Hasil) :-
    R>0, R<8,
    Hasil is Tuna,!.
subsubgacha5(R, Hasil) :-
    R>7, R<20, 
    Hasil is Salmon, !.
subsubgacha5(R, Hasil) :-
    R>19, R<36, 
    Hasil is Gurame, !.
subsubgacha5(R, Hasil) :-
    R>35, R<71, 
    Hasil is Tongkol, !.
subsubgacha5(R, Hasil) :-
    R>70, R<86, 
    Hasil is Lele, !.
subsubgacha5(R, Hasil) :-
    R>85, R<101, 
    Hasil is Garbage, !.

/* hasil gacha buat level 3 exp fishing dengan fishing rod level 2 */
subsubgacha6(R, Hasil) :-
    R>0, R<13,
    Hasil is Tuna, !.
subsubgacha6(R, Hasil) :-
    R>12, R<28, 
    Hasil is Salmon, !.
subsubgacha6(R, Hasil) :-
    R>27, R<53, 
    Hasil is Gurame, !.
subsubgacha6(R, Hasil) :-
    R>52, R<86, 
    Hasil is Tongkol, !.
subsubgacha6(R, Hasil) :-
    R>85, R<96, 
    Hasil is Lele, !.
subsubgacha6(R, Hasil) :-
    R>95, R<101, 
    Hasil is Garbage, !.

printHasil(Hasil) :-
    Hasil is Tuna,
    addItem('Tuna', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Tuna (Rank S)        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil is Salmon,
    addItem('Salmon', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Salmon (Rank A)      |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil is Gurame,
    addItem('Gurame', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Gurame (Rank B)      |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil is Tongkol,
    addItem('Tongkol', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Tongkol (Rank C)     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil is Lele,
    addItem('Lele', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Lele (Rank D)        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil is Garbage,
    write('|----------------------------------------------------|'),nl,
    write('|      Sorry, You got nothing. Keep fishing! ^_^     |'),nl,
    write('|----------------------------------------------------|'),nl
    .
