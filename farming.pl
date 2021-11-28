:- include('item.pl').
:- include('player.pl').

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
            delseed(1, wortel), !
            ;
        (Choice = tomat, (\+ seed(0, tomat))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(tomat,X,Y,0)),
            delseed(1, tomat), !
            ;
        (Choice = kentang, (\+ seed(0, kentang))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(kentang,X,Y,0)),
            delseed(1, kentang), !
            ;
        (Choice = jagung, (\+ seed(0, jagung))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(jagung,X,Y,0)),
            delseed(1, jagung), !
            ;
        (Choice = stroberi, (\+ seed(0, stroberi))) ->
            retract(lokasi(digged_tile, X, Y)),
            asserta(lokasi_farm(stroberi,X,Y,0)),
            delseed(1, stroberi), !
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

wortel_time(3).
tomat_time(5).
kentang_time(4).
jagung_time(10).
stroberi_time(8).

gachaharvest(1, 1, Crop) :-
    addItem(Crop, 1).

gachaharvest(1, 2, Crop) :-
    random(1, 11, Hasil1),
    (   (Hasil1 = 1) -> addItem(Crop, 2);
        (Hasil1>1, Hasil1<11) -> addItem(Crop, 1)
    )
    .

gachaharvest(2, 1, Crop) :-
    random(1, 11, Hasil2),
    (   (Hasil2 = 1) -> addItem(Crop, 2);
        (Hasil2>1, Hasil2<11) -> addItem(Crop, 1)
    )
    .

gachaharvest(2, 2, Crop) :-
    random(1, 11, Hasil3),
    (   (Hasil3>0, Hasil3<3) -> addItem(Crop, 2);
        (Hasil3>2, Hasil3<11) -> addItem(Crop, 1)
    )
    .

gachaharvest(1, 3, Crop) :-
    random(1, 11, Hasil4),
    (   (Hasil4>0, Hasil4<3) -> addItem(Crop, 2);
        (Hasil4>2, Hasil4<11) -> addItem(Crop, 1)
    )
    .

gachaharvest(2, 3, Crop) :-
    random(1, 11, Hasil5),
    (   (Hasil5>0, Hasil5<4) -> addItem(Crop, 2);
        (Hasil5>3, Hasil5<11) -> addItem(Crop, 1)
    )
    .

harvest :-
    lokasi(player, X, Y),
    write('tes anjeng'), nl,
    lvlFarm(LevelFarm),
    write('tes anjeng 2'), nl,
    equipment('Shovel', LevelShovel, _),
    write('tes anjeng 3'), nl,
    lokasi_farm(Crop, X, Y, Umur),
    write('tes anjeng 4'), nl,
    (   (Crop = wortel, wortel_time(Time), Time =< Umur) ->
            retract(lokasi_farm(_,X,Y,_)),
            write('tes anjeng 5'), nl,
            gachaharvest(LevelFarm, LevelShovel, 'Wortel'),
            write('tes anjeng 6'), nl
            ;
        (Crop = tomat, tomat_time(Time), Time =< Umur) ->
            retract(lokasi_farm(_,X,Y,_)),
            gachaharvest(LevelFarm, LevelShovel, 'Tomat')
            ;
        (Crop = kentang, kentang_time(Time), Time =< Umur) ->
            retract(lokasi_farm(_,X,Y,_)),
            gachaharvest(LevelFarm, LevelShovel, 'Kentang')
            ;
        (Crop = jagung, jagung_time(Time), Time =< Umur) ->
            retract(lokasi_farm(_,X,Y,_)),
            gachaharvest(LevelFarm, LevelShovel, 'Jagung')
            ;
        (Crop = stroberi, stroberi_time(Time), Time =< Umur) ->
            retract(lokasi_farm(_,X,Y,_)),
            gachaharvest(LevelFarm, LevelShovel, 'Stroberi')
            ;
        write('Sorry, you can\'t harvest your crop right now :(('), nl
    ).


harvest :-
    atRanch(0), atMarketplace(0), atQuest(0), atHouse(1), !,
    write('|----------------------------------------------------|'),nl,
    write('|    Can\'t harvest, You are at House right now ._.   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

harvest :-
    atRanch(0), atMarketplace(0), atQuest(1), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|    Can\'t harvest, You are at Quest right now ._.   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

harvest :-
    atRanch(0), atMarketplace(1), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|Can\'t harvest, You are at Marketplace right now ._. |'),nl,
    write('|----------------------------------------------------|'),nl
    .

harvest :-
    atRanch(1), atMarketplace(0), atQuest(0), atHouse(0), !,
    write('|----------------------------------------------------|'),nl,
    write('|    Can\'t harvest, You are at Ranch right now ._.   |'),nl,
    write('|----------------------------------------------------|'),nl
    .

harvest :- 
    write('|----------------------------------------------------|'),nl,
    write('|      There is nothing to harvest  ( •̀ ω •́ )✧       |'),nl,
    write('|----------------------------------------------------|'),nl
    .
