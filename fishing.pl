:- include('item.pl').
:- include('player.pl').
:- include('start.pl').

fish :-
    equipment('Fishing Rod', _, 0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t fish, use your fishing rod first!        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

addExpFishing :-
    class(X),
    (X = fisherman -> 
        tambahExpFish(15),
        tambahExp(15),
        write('You gained 15 exp.'), nl;
        tambahExpFish(10),
        tambahExp(10),
        write('You gained 10 exp.'), nl
    ).

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    W is Y-1,
    lokasi(air, X, W), !,
    gacha(1, A),
    addExpFishing.

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    A is X-1,
    lokasi(air, A, Y), !,
    gacha(1, A),
    addExpFishing.

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    S is Y+1,
    lokasi(air, X, S), !,
    gacha(1, A),
    addExpFishing.

fish :- 
    equipment('Fishing Rod', A, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    D is X+1,
    lokasi(air, D, Y), !,
    gacha(1, A),
    addExpFishing.


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
    (R11 = 1 -> printHasil(tuna); 
    (R11>1, R11<7) -> printHasil(salmon); 
    (R11 > 6, R11<21) -> printHasil(gurame); 
    (R11>20, R11<41) -> printHasil(tongkol); 
    (R11>40, R11<71) -> printHasil(lele); 
    (R11>70, R11<101) -> printHasil(garbage)).

subgacha(2, 1) :-
    random(1, 101, R21),
    ((R21>0, R21<6) -> printHasil(tuna); 
    (R21>5, R21<16) -> printHasil(salmon); 
    (R21>15, R21<31) -> printHasil(gurame); 
    (R21>30, R21<61) -> printHasil(tongkol); 
    (R21>60, R21<81) -> printHasil(lele); 
    (R21>80, R21<101) -> printHasil(garbage)).

subgacha(3, 1) :-
    random(1, 101, R31),
    ((R31>0, R31<11) -> printHasil(tuna); 
    (R31>10, R31<24) -> printHasil(salmon); 
    (R31>23, R31<44) -> printHasil(gurame); 
    (R31>43, R31<79) -> printHasil(tongkol); 
    (R31>78, R31<91) -> printHasil(lele); 
    (R31>90, R31<101) -> printHasil(garbage)).

subgacha(1, 2) :-
    random(1, 101, R12),
    ((R12>0, R12<3) -> printHasil(tuna); 
    (R12>2, R12<9) -> printHasil(salmon); 
    (R12>8, R12<21) -> printHasil(gurame); 
    (R12>20, R12<41) -> printHasil(tongkol); 
    (R12>40, R12<71) -> printHasil(lele); 
    (R12>70, R12<101) -> printHasil(garbage)).

subgacha(2, 2) :-
    random(1, 101, R22),
    ((R22>0, R22<8) -> printHasil(tuna); 
    (R22>7, R22<20) -> printHasil(salmon); 
    (R22>19, R22<36) -> printHasil(gurame); 
    (R22>35, R22<71) -> printHasil(tongkol); 
    (R22>70, R22<86) -> printHasil(lele); 
    (R22>85, R22<101) -> printHasil(garbage)).

subgacha(3, 2) :-
    random(1, 101, R32),
    ((R32>0, R32<13) -> printHasil(tuna); 
    (R32>12, R32<28) -> printHasil(salmon); 
    (R32>27, R32<53) -> printHasil(gurame); 
    (R32>52, R32<86) -> printHasil(tongkol); 
    (R32>85, R32<96) -> printHasil(lele); 
    (R32>95, R32<101) -> printHasil(garbage)).

printHasil(Hasil) :-
    Hasil = tuna ->
    addItem('Tuna', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Tuna (Rank S)        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil = salmon ->
    addItem('Salmon', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Salmon (Rank A)      |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil = gurame ->
    addItem('Gurame', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Gurame (Rank B)      |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil = tongkol ->
    addItem('Tongkol', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Tongkol (Rank C)     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil = lele ->
    addItem('Lele', 1),
    write('|----------------------------------------------------|'),nl,
    write('|      Congratulations! You got Lele (Rank D)        |'),nl,
    write('|----------------------------------------------------|'),nl
    .

printHasil(Hasil) :-
    Hasil = garbage ->
    write('|----------------------------------------------------|'),nl,
    write('|      Sorry, You got nothing. Keep fishing! ^_^     |'),nl,
    write('|----------------------------------------------------|'),nl
    .
