inventory :-
    totalInventory(Sum),
    Sum is 0,
    write('Inventory sementara kosong').

inventory :-
    totalInventory(Sum),
    Sum > 0,
    write('Your inventory ('), write(sum), write(' /100)'), nl.

:- dynamic(totalInventory/1).
totalInventory(0).