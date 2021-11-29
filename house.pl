/*:- include('explore.pl').
:- include('map.pl').
:- include('peta.pl').
:- include('map_peri_tidur.pl').
:- include('farming.pl').
:- include('start.pl').
*/
:- dynamic(day/1).
day(1).
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
    atHouse(1),
    day(N),
    (N < 101 ->
        write('You went to sleep'), !, nl,nl,
        NextN is N+1,
        retract(day(N)),
        assertz(day(NextN)),
        peritidur,
        write('Day '), write(NextN),
        forall(lokasi_farm(A,B,C,D), (Dnew is D + 1, retract(lokasi_farm(A,B,C,D)),asserta(lokasi_farm(A,B,C,Dnew)) ))
        ;
    N = 101 ->
        failState
    ).
sleep :-
    write('|------------------------------------|'),nl,
    write('| You can only sleep at house zZzz...|'),nl,
    write('|------------------------------------|'),nl.



failState :-
    write('You fail bro').

peritidur :-
    random(1,15,X),
    (X = 13 ->
        write('hi im peri tidur. Where do you want to go?'),nl,
        read(ChoiceX),
        read(ChoiceY),
        (lokasi(quest,ChoiceX,ChoiceY) ->
            write('you can\'t go there')
            ;
        lokasi(air,ChoiceX,ChoiceY) ->
            write('you can\'t go there')
            ;
        lokasi(ranch,ChoiceX,ChoiceY) ->
            write('you can\'t go there')
            ;
        lokasi(market,ChoiceX,ChoiceY) ->
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
