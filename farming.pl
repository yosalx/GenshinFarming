:- include('item.pl')

dig :-
    equipment('shovel', _, 1),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    (\+ lokasi_farm(_, X, Y, _)),
    asserta(lokasi(digged_tile, X, Y)).

dig :-
    equipment('shovel', _, 0),
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    (\+ lokasi_farm(_, X, Y, _)),
    write('tidak dapat menggali tanah, shovel belum digunakan'), nl.



plant<> :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(digged_tile, X, Y),
    seed(A, <>),
    Anew is A-1,
    seed(Anew, <>),
    asserta(lokasi_farm(<>, X, Y, 0)).


harvest<> :-
    lokasi(player, X, Y),
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(0),
    lokasi(<>, X, Y),
    lokasi_farm(<>, X, Y, age),
    retract(lokasi_farm(<>, X, Y, age)),
    asserta(lokasi_farm())
    

:- dynamic(seed/2)
seed(0, )

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

