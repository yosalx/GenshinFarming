/*:- include('explore.pl').
:- include('map.pl').
:- include('peta.pl').
:- include('map_peri_tidur.pl').
:- include('farming.pl').
:- include('start.pl').
*/
:- dynamic(day/1).
day(364).
:- dynamic(resin/1).
resin(5).
useResin :-
    resin(Sum),
    (Sum > 0 ->
        retract(resin(Sum)),
        New is Sum-1,
        assertz(resin(New)),
        write('')
        ;
    Sum = 0 ->
        write('Resin tidak cukup, anda harus segera tidur!'),
        fail
    ).

house :-
    write('        )'),nl,
    write('       ( _   _._'),nl,
    write('        |_|-^_~_`-._'),nl,
    write('    _.-^-_~_-~_-~-_`-._'),nl,
    write('_.-^_~-_~-_-~-_~_~-_~-_`-._'),nl,
    write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'),nl,
    write('  |  []  []   []   []  [] |'),nl,
    write('  |           __    ___   |'),nl,
    write('._|  []  []  | .|  [___]  |_._._._._._._._._._._._._._._._._.'),nl,
    write('|=|________()|__|()_______|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|=|'),nl,
    write('^^^^^^^^^^^^^^^ === ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'),nl,
    write('                   ==='),nl,
    write('                       ==='),nl,

    write('|--------------------------------------------|'),nl,
    write('|            Home Sweet Home .....           |'),nl,
    write('|         What do you want to do ?           |'),nl,
    write('|         - Sleep                            |'),nl,
    write('|         - writeDiary                       |'),nl,
    write('|         - exit                             |'),nl,
    write('|--------------------------------------------|'),nl
    .

sleep :-
    day(N),
    (N < 101 ->
        write('You went to sleep'),nl,nl,
        NextN is N+1,
        retract(day(N)),
        assertz(day(NextN)),
        write('Day '), write(NextN)
        ;
    N = 101 ->
        failState
    ).

failState :-
    write('You fail bro').

peritidur :-
    random(1,15,X),
    (X = 13 ->
        write('hi im peri tidur. Where do you want to go?'),nl,
        map_peri_tidur,
        read(ChoiceX),
        read(ChoiceY),
        lokasi(quest,X,Y),
        lokasi(air,X1,Y1),
        lokasi(ranch,X2,Y2),
        lokasi(market,X3,Y3),
        (ChoiceX = X ->
            write('you can\'t go there')
            ;
        ChoiceX = X1 ->
            write('you can\'t go there')
            ;
        ChoiceX = X2 ->
            write('you can\'t go there')
            ;
        ChoiceX = X3 ->
            write('you can\'t go there')
            ;
        ChoiceY = Y ->
            write('you can\'t go there')
            ;
        ChoiceY = Y1 ->
            write('you can\'t go there')
            ;
        ChoiceY = Y2 ->
            write('you can\'t go there')
            ;
        ChoiceY = Y3 ->
            write('you can\'t go there')
            ;
            teleport(ChoiceX,ChoiceY),
            write('You are teleported!')
        )
    ;
    write('gagal'),
    write('')
    ).

:- dynamic(listDiary/1).
listDiary([]).

writeDiary :-
    listDiary(List),
    write('write your diary here'),nl,
    read(Input),
    day(Day),
    append(List, [[Day, Input]], NewList),
    retract(listDiary(List)),
    assertz(listDiary(NewList)),
    write('done').

showDiaryEntry([]) :-
    write('').

showDiaryEntry([[Day, _]|T]) :-
    write('Day '), write(Day), nl,
    showDiaryEntry(T).


readDiary :-
    listDiary(List),
    showDiaryEntry(List),
    write('select day'),nl,
    read(Choice),
    (member([Choice, Entry], List) ->
        write(Entry)
        ;
    write('Day tidak ada')
    ).
