:-dynamic(class/1).
class(none).

:- dynamic(game_start/1).

game_start(false).

init_game :-
    retract(game_start(false)),
    asserta(game_start(true)),
    [map], nl,
    include_map, nl,
    [explore], nl,
    [map_peri_tidur], nl,
    include_explore, nl, 
    [ranching], nl,
    [marketplace], nl,
    [inventory], nl,
    [farming], nl,
    [fishing], nl,
    [house], nl,
    [quest], nl,
    [player], nl.

sdebug :-
    init_game.

start :-
    init_game,
    write(''),nl,
    write('..######...########.##....##..######..##.....##.####.##....##.########....###....########..##.....##.####.##....##..######..'),nl,
    write('.##....##..##.......###...##.##....##.##.....##..##..###...##.##.........##.##...##.....##.###...###..##..###...##.##....##.'),nl,
    write('.##........##.......####..##.##.......##.....##..##..####..##.##........##...##..##.....##.####.####..##..####..##.##.......'),nl,
    write('.##...####.######...##.##.##..######..#########..##..##.##.##.######...##.....##.########..##.###.##..##..##.##.##.##...####'),nl,
    write('.##....##..##.......##..####.......##.##.....##..##..##..####.##.......#########.##...##...##.....##..##..##..####.##....##.'),nl,
    write('.##....##..##.......##...###.##....##.##.....##..##..##...###.##.......##.....##.##....##..##.....##..##..##...###.##....##.'),nl,
    write('..######...########.##....##..######..##.....##.####.##....##.##.......##.....##.##.....##.##.....##.####.##....##..######..'),nl,nl,

    write('............................................ Welcome to Genshin Farming ! ..................................................'),nl,nl,
    write('...................................... 1. start     : untuk memulai petualanganmu ..........................................'),nl,
    write('...................................... 2. map       : menampilkan peta .....................................................'),nl,
    write('...................................... 3. status    : menampilkan kondisimu terkini ........................................'),nl,
    write('...................................... 4. w         : gerak ke utara 1 langkah .............................................'),nl,
    write('...................................... 5. s         : gerak ke selatan 1 langkah ...........................................'),nl,
    write('...................................... 6. d         : gerak ke timur 1 langkah .............................................'),nl,
    write('...................................... 7. a         : gerak ke barat 1 langkah .............................................'),nl,
    write('...................................... 8. help      : menampilkan segala bantuan ...........................................'),nl,
    write('...................................... 9. Status    : menampilkan status pemain ............................................'),nl,nl,nl,nl,
    
    pilihClass
    .


pilihClass :-
    repeat,
    write('Welcome to Genhsin Farming. Choose your job\n1. Fisherman\n2. Farmer\n3. Rancher'), nl,
    read_integer(X),
    (X = 1 -> 
        retract(class(none)),
        asserta(class(fisherman)),
        createChara(fisherman);
    X = 2 ->
        retract(class(none)),
        asserta(class(farmer)),
        createChara(farmer);
    X = 3 ->
        retract(class(none)),
        asserta(class(rancher)),
        createChara(rancher);
    write('There\'s only 3 option you know')
    )
    . 

quit:-
    write('Apakah Anda yakin untuk keluar dari permainan? (y/n)'),
    read(Order),
    (Order = y -> halt; (Order = n -> fail)).

help:-
    write('############################ Command ############################'),nl,
    write('help  : menampilkan segala bantuan'),nl,
    write('start : memulai petualangan dari awal'), nl,
    write('status: menampilkan kondisi pemain saat ini'), nl,
    write('quit  : mengakhiri petualangan'), nl, nl, nl,

    write('############################ Navigasi ############################'), nl,
    write('map      : melihat map'),nl,
    write('w,a,s,d  : untuk bergerak, pemain tidak dapat bergerak ke danau'), nl.