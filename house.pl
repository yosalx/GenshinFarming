:- dynamic(time/1).
time(365).

house :-
    write('What do you want to do'),nl,
    write('-  Sleep'),nl,
    write('- writeDiary'),nl,
    write('- readDiary'),nl,
    write('- exit'),nl.

sleep :-
    time(N),
    (N < 365 ->
        write('You went to sleep'),nl,nl,
        NextN is N+1,
        retract(time(N)),
        assertz(time(NextN)),
        write('Day '), write(NextN)
        ;
    N = 365 ->
        failState
    ).

failState :-
    write('You fail bro').


