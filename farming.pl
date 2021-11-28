:- include('item.pl').

dig :-
    equipment('shovel', _, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    (\+ lokasi_farm(_, X, Y, _)),
    (\+ lokasi(digged_tile, X, Y)),
    asserta(lokasi(digged_tile, X, Y)), !,
    write('|----------------------------------------------------|'),nl,
    write('|           Successfully dug this tile :)            |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|      Can\'t dig, You are at House right now ._.     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    atRanch(0), atMarketplace(0), atQuest(1), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|      Can\'t dig, You are at Quest right now ._.     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    atRanch(0), atMarketplace(1), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|   Can\'t dig, You are at Marketplace right now ._.  |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    atRanch(1), atMarketplace(0), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|      Can\'t dig, You are at Ranch right now ._.     |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    equipment('shovel', _, 0),
    write('|----------------------------------------------------|'),nl,
    write('|      Can\'t dig, equip your shovel first! ^_^       |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    lokasi(player, X, Y),
    lokasi(digged_tile, X,Y), !,
    write('|----------------------------------------------------|'),nl,
    write('|         Can\'t dig, This tile already dug           |'),nl,
    write('|----------------------------------------------------|'),nl
    .

dig :-
    write('|----------------------------------------------------|'),nl,
    write('|      Can\'t dig this tile, there are crop here      |'),nl,
    write('|----------------------------------------------------|'),nl
    .


    

/*
plant(Name) :-
    Name == wortel,
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(digged_tile, X, Y),
    seed(A, WortelSeed),
    Anew is A-1,
    seed(Anew, WortelSeed),
    asserta(lokasi_farm(wortel, X, Y, 0)).

plant(Name) :-
    Name == tomat,
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(digged_tile, X, Y),
    seed(A, TomatSeed),
    Anew is A-1,
    seed(Anew, TomatSeed),
    asserta(lokasi_farm(tomat, X, Y, 0)).

plant(Name) :-
    Name == kentang,
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(digged_tile, X, Y),
    seed(A, KentangSeed),
    Anew is A-1,
    seed(Anew, KentangSeed),
    asserta(lokasi_farm(kentang, X, Y, 0)).

plant(Name) :-
    Name == jagung,
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(digged_tile, X, Y),
    seed(A, JagungSeed),
    Anew is A-1,
    seed(Anew, JagungSeed),
    asserta(lokasi_farm(jagung, X, Y, 0)).

plant(Name) :-
    Name == stroberi,
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(digged_tile, X, Y),
    seed(A, StroberiSeed),
    Anew is A-1,
    seed(Anew, StroberiSeed),
    asserta(lokasi_farm(stroberi, X, Y, 0)).

plant(_) :-
    lokasi(player, X, Y),
    (\+ lokasi(digged_tile, X, Y)),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    write('Tanah belum digali.'), nl.

plant

plant(Name) :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(1),
    write('Tidak bisa menanam '), write(Name), write(', Anda sedang berada di Rumah.'), nl.

plant(Name) :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(1), atHouse(0),
    write('Tidak bisa menanam '), write(Name), write(', Anda sedang berada di Quest.'), nl.

plant(Name) :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(1), atQuest(0), atHouse(0),
    write('Tidak bisa menanam '), write(Name), write(', Anda sedang berada di Marketplace.'), nl.

plant(Name) :-
    lokasi(player, X, Y),
    atRanch(1), atMarketplace(0), atQuest(0), atHouse(0),
    write('Tidak bisa menanam '), write(Name), write(', Anda sedang berada di Ranch.'), nl.

harvest :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(_, X, Y),
    lokasi_farm(_, X, Y, age),
    retract(lokasi_farm(_, X, Y, age)).

harvest :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(1),
    write('Tidak bisa memanen, Anda sedang berada di Rumah'), nl.

harvest :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(1), atHouse(0),
    write('Tidak bisa memanen, Anda sedang berada di Quest'), nl.

harvest :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(1), atQuest(0), atHouse(0),
    write('Tidak bisa memanen, Anda sedang berada di Marketplace'), nl.

harvest :-
    lokasi(player, X, Y),
    atRanch(1), atMarketplace(0), atQuest(0), atHouse(0),
    write('Tidak bisa memanen, Anda sedang berada di Ranch'), nl.
*/
:- dynamic(seed/2).
seed(0, wortel).
seed(0, tomat).
seed(0, kentang).
seed(0, jagung).
seed(0, stroberi).

addseed(N, Name) :-
    seed(Sum, Name),
    NewSum is Sum + N,
    retract(seed(Sum, Name)),
    asserta(seed(NewSum, Name)).

delseed(N, Name) :-
    seed(Sum, Name),
    NewSum is Sum - N,
    retract(seed(Sum, Name)),
    asserta(seed(NewSum, Name)).

