:- include('item.pl').

inventory :-
    totalInventory(Sum),
    Sum is 0,
    write('Inventory sementara kosong'), nl.

inventory :-
    totalInventory(Sum),
    Sum > 0,
    write('Your inventory ('), write(Sum), write(' / 100)'), nl, nl,
    showEquipments,
    showItems.

:- dynamic(totalInventory/1).
totalInventory(10).

addInventory(N) :-
    totalInventory(Sum),
    NewSum is Sum + N,
    retract(totalInventory(Sum)),
    asserta(totalInventory(NewSum)).

delInventory(N) :-    
    totalInventory(Sum),
    NewSum is Sum - N,
    retract(totalInventory(Sum)),
    asserta(totalInventory(NewSum)).