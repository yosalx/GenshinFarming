inventory :-
    totalInventory(sum),
    sum is 0,
    write('Inventory sementara kosong')

inventory :-
    totalInventory(sum),
    sum > 0,
    write('Your inventory ('), write(sum), write(' /100)'), nl.

:- dynamic(totalInventory/1)
totalInventory(0).