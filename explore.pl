:- dynamic(atQuest/1).
:- dynamic(atHouse/1).
:- dynamic(atMarketplace/1).
:- dynamic(atRanch/1).

include_explore :- 
    [explore_w],
    [explore_a],
    [explore_s],
    [explore_d],
    asserta(atRanch(0)), asserta(atMarketplace(0)), asserta(atQuest(0)), asserta(atHouse(0)).

nabrak :-
    write('Anda menabrak.'),
    nl,
    write('Ketik \'map\' untuk melihat posisi Anda.'),
    nl.




