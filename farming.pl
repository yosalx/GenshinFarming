:- include('item.pl').

dig :-
    equipment('Shovel', _, 1),
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
    equipment('Shovel', _, 0), !,
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
    write('|      Can\'t dig this tile, there is crop here       |'),nl,
    write('|----------------------------------------------------|'),nl
    .

/* seed(jumlah, nama_seed) */
:- dynamic(seed/2).
seed(10, wortel).
seed(10, tomat).
seed(10, kentang).
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

showallseed :-
    forall((seed(Sum, Name)), (listseed(Sum, Name))).

listseed(Sum, Name) :-
    (Sum > 0 ->
        write(Sum), write(' '), write(Name), nl;
    Sum is 0 ->
        write('')
    ).

plant :-
    seed(0, wortel),
    seed(0, tomat),
    seed(0, kentang),
    seed(0, jagung),
    seed(0, stroberi), !,
    write('|------------------------------------------------|'),nl,
    write('|    Sorry you don\'t have any seed to plant :(   |'),nl,
    write('|------------------------------------------------|'),nl.

plant :-
    lokasi(player, X, Y),
    lokasi(digged_tile, X, Y), !,
    write('         wWWWw               wWWWw           '), nl,
    write('   vVVVv (___) wWWWw         (___)  vVVVv    '), nl,
    write('   (___)  ~Y~  (___)  vVVVv   ~Y~   (___)    '), nl,
    write('    ~Y~   \\|    ~Y~   (___)    |/    ~Y~     '), nl,
    write('    \\|   \\ |/   \\| /  \\~Y~/   \\|    \\ |/     '), nl,
    write('   \\\\|// \\\\|// \\\\|/// \\\\|//  \\\\|// \\\\\\|///   '), nl,
    write('   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  '), nl,
    write('|------------------------------------------------|'),nl,
    write('|         What do you want to plant ?            |'),nl,
    write('|                   You have :                   |'),nl,
    write('|------------------------------------------------|'),nl,nl,
    showallseed, nl,
    write('|------------------------------------------------|'),nl,
    write('|      Please select seed you want to plant :    |'),nl,
    write('|------------------------------------------------|'),nl,
    write('input your choice : '), read(Choice), nl,
    (   (Choice = wortel, (\+ seed(0, wortel))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(wortel,X,Y,0)),
            seed(Sum, wortel),
            NewSum is Sum -1,
            retract(seed(Sum, wortel)),
            asserta(seed(NewSum, wortel)), !
            ;
        (Choice = tomat, (\+ seed(0, tomat))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(tomat,X,Y,0)),
            seed(Sum, tomat),
            NewSum is Sum -1,
            retract(seed(Sum, tomat)),
            asserta(seed(NewSum, tomat)), !
            ;
        (Choice = kentang, (\+ seed(0, kentang))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(kentang,X,Y,0)),
            seed(Sum, kentang),
            NewSum is Sum -1,
            retract(seed(Sum, kentang)),
            asserta(seed(NewSum, kentang)), !
            ;
        (Choice = jagung, (\+ seed(0, jagung))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(jagung,X,Y,0)),
            seed(Sum, jagung),
            NewSum is Sum -1,
            retract(seed(Sum, jagung)),
            asserta(seed(NewSum, jagung)), !
            ;
        (Choice = stroberi, (\+ seed(0, stroberi))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(stroberi,X,Y,0)),
            seed(Sum, stroberi),
            NewSum is Sum -1,
            retract(seed(Sum, stroberi)),
            asserta(seed(NewSum, stroberi)), !
            ;
        write('Sorry, you don\'t have that seed :('), nl, fail
    ).

plant :-
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t plant, You are at House right now ._.    |'),nl,
    write('|----------------------------------------------------|'),nl
    .

plant :-
    atRanch(0), atMarketplace(0), atQuest(1), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t plant, You are at Quest right now ._.    |'),nl,
    write('|----------------------------------------------------|'),nl
    .

plant :-
    atRanch(0), atMarketplace(1), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|  Can\'t plant, You are at Marketplace right now ._. |'),nl,
    write('|----------------------------------------------------|'),nl
    .

plant :-
    atRanch(1), atMarketplace(0), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|     Can\'t plant, You are at Ranch right now ._.    |'),nl,
    write('|----------------------------------------------------|'),nl
    .

plant :-
    lokasi(player, X, Y),
    lokasi_farm(_, X,Y, _), !,
    write('|----------------------------------------------------|'),nl,
    write('|          Can\'t plant, There is crop here           |'),nl,
    write('|----------------------------------------------------|'),nl
    .

plant :-
    lokasi(player, X, Y),
    (\+ lokasi(digged_tile, X, Y)), !,
    write('|----------------------------------------------------|'),nl,
    write('|        Can\'t plant seed on undigged tile :<        |'),nl,
    write('|----------------------------------------------------|'),nl
    .
