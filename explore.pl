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
    write('|------------------------------------------------|'),nl,
    write('|           You hit the border ! (x_x)           |'),nl,
    write('|              please check your map             |'),nl,
    write('|------------------------------------------------|'),nl
    .

air :-
    write('|------------------------------------------------|'),nl,
    write('|       It\'s the water, you remember that        |'),nl,
    write('|           you can\'t swim, don\'t you?           |'),nl,
    write('|------------------------------------------------|'),nl.
exit:-
    atRanch(1),
    write('|------------------------------------------------|'),nl,
    write('|      Goodbye, your animals will miss you !     |'),nl,
    write('|------------------------------------------------|'),nl,
    retract(atRanch(1)), asserta(atRanch(0)),!.

exit:-
    atMarketplace(1),
    write('|------------------------------------------------|'),nl,
    write('|       Okay, make sure to come back later !     |'),nl,
    write('|------------------------------------------------|'),nl,
    retract(atMarketplace(1)), asserta(atMarketplace(0)),!.

exit:-
    atQuest(1),
    write('|------------------------------------------------|'),nl,
    write('|       Good luck ! come back if you are done    |'),nl,
    write('|------------------------------------------------|'),nl,
    retract(atQuest(1)), asserta(atQuest(0)),!.

exit:-
    atHouse(1),
    write('|------------------------------------------------|'),nl,
    write('|            Let\'s get to work \\( ﾟヮﾟ)9         |'),nl,
    write('|------------------------------------------------|'),nl,
    retract(atHouse(1)), asserta(atHouse(0)),!.

exit:-
    write('|------------------------------------------------|'),nl,
    write('|     Umm... you are already outside... (o_o)    |'),nl,
    write('|------------------------------------------------|'),nl
    .

teleport(A,B) :-
    lokasi(player, X, Y),
    retract(lokasi(player, X, Y)),
    asserta(lokasi(player, A, B)).