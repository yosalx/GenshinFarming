:- include('explore.pl').
:- dynamic(day/1).
:- include('map.pl').
:- include('peta.pl').
day(364).

house :-
    write('What do you want to do'),nl,
    write('-  Sleep'),nl,
    write('- writeDiary'),nl,
    write('- readDiary'),nl,
    write('- exit'),nl.

sleep :-
    day(N),
    (N < 365 ->
        write('You went to sleep'),nl,nl,
        NextN is N+1,
        retract(day(N)),
        assertz(day(NextN)),
        write('Day '), write(NextN)
        ;
    N = 365 ->
        failState
    ).

failState :-
    write('You fail bro').

peritidur :-
    random(1,15,X),
    (X = 13 ->
        write('hi im peri tidur. Where do you want to go?'),
        write('1. Ranch'),nl,
        write('2. Pond'),nl,
        write('3. Marketplace'),nl,
        read(Choice),
        (Choice = 1 ->
            lokasi(ranch,X,Y),
            teleport(X,Y),
            retract(atRanch(0)),
            assertz(atRanch(1)),
            write('masuk ranch')
            ;
        Choice = 2 ->
            teleport(4,8),
            write('hahy')
            ;
        Choice = 3 ->
            lokasi(market,X,Y),
            teleport(X,Y),
            retract(atMarketplace(0)),
            assertz(atMarketplace(1)),
            write('masuk market')
            ;
        write('defal')
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
