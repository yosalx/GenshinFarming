/* jenisitem(jumlah, nama item) */
:- dynamic(item/2).
item(0, wortel).
item(0, tomat).
item(0, kentang).
item(5, jagung).
item(6, stroberi).
item(0, tuna).
item(0, salmon).
item(0, tongkol).
item(0, lele).
item(0, gurame).
item(0, susu).
item(0, telur).
item(0, wol).

showItems :-
    forall((item(Sum, Name)),(listItems(Sum, Name))).

listItems(Sum, Name):-
    (Sum > 0 ->
        write(Sum), write(' '), write(Name), nl
        ;
    Sum is 0 ->
        write('')
    ).

/* equipment(nama, level, terpakai atau tidak) */
/* 1 untuk terpakai, 0 untuk tidak */
:- dynamic(equipment/3).
equipment(shovel, 1, 0).
equipment(fishingRod, 1, 0).
equipment(ranchingKit, 1, 0).

showEquipments :-
    forall((equipment(Name, Lvl, Used)), (listEquipments(Name, Lvl, Used)))
    . 

listEquipments(Name, Lvl, Used) :-
    (Used = 0 ->
        write('1'), write(' Level '), write(Lvl), write(' '), write(Name), nl
        ;
    Used = 1 ->
        write('')
    ).