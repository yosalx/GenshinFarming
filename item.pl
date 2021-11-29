/* itemList berguna untuk menyimpan list item */
:- dynamic(itemList/1).
itemList([['Fish', 1], ['Wortel', 2]]).

showItems([]) :-
    write('').

showItems([[Name, Sum]|T]) :-
    write(Sum), write(' '), write(Name), nl,
    showItems(T).

addItem(_, Count) :- 
    Count =< 0, !, 
    write(''), 
    fail.

/* buat make addItem di tempat lain ikutin format ini */
/* Item pake tanda kutip dan diawali kapital, Sum angka bebas */
addItem(Item, Sum) :-
    itemList(Items),
    totalInventory(Total),
    (Total + Sum =< 100 ->
        (member([Item, CurrSum], Items) ->
            NewSum is CurrSum + Sum,
            delete(Items, [Item, CurrSum], TempItems),
            append(TempItems, [[Item, NewSum]], NewItems),
            retract(itemList(Items)),
            assertz(itemList(NewItems)),
            addInventory(Sum)
        ;
            append(Items, [[Item, Sum]], NewItems),
            retract(itemList(Items)),
            assertz(itemList(NewItems)),
            addInventory(Sum)
        )
    ;
        write('Inventory Penuh')
    ).

useItem(_, Count) :- 
    Count =< 0, !, 
    write(''), 
    fail.
    
useItem(Item, Sum) :-
    itemList(Items),
    (member([Item, CurrSum], Items) ->
        (CurrSum > Sum ->
            NewSum is CurrSum - Sum,
            delete(Items, [Item, CurrSum], TempItems),
            append(TempItems, [[Item, NewSum]], NewItems),
            retract(itemList(Items)),
            assertz(itemList(NewItems)),
            delInventory(Sum)
        ; CurrSum = Sum ->
            delete(Items, [Item, Sum], NewItems),
            retract(itemList(Items)),
            assertz(itemList(NewItems)),
            delInventory(Sum)
        ;
            write('Not Enough '), write(Item), fail
        )
    ;
        write('You do not have '), write(Item), write(' in your inventory'), fail
    ).

throwItem :-

    write('                                   ,//////+//((////+++++++    '),nl,              
    write('                           +%%(+(/(+///+//+++////++/+++++,..   '),nl,             
    write('                     //////(%@%##(((//(((//////++(++++++(,,/   '),nl,        
    write('                ,////////////////((#%/#%+/++++/++++++(,,,(++    '),nl,            
    write('             ////#////////////////++++++//+++++++(,,.+(+++,,    '),nl,            
    write('           //////#////////+++++/(/++++++++++/,, ,+(+++,,,,      '),nl,            
    write('          //////////////++++++++++++//+++.++//+++++,,,,        '),nl,             
    write('          (///(#/++++++/(#/+++++,++,+((/++++++++,,+            '),nl,             
    write('           (/(#(((((/////(((/+,,,,,,,,+++++,,                  '),nl,             
    write('             /////////////+++,,,...,,+                          '),nl,            
    write('                      ..                                       .     '),nl,       
    write('          .   . .   .                             .   . .          '),nl,         
    write('         .     ./(#((((((########(((((((((((((((((###%/.            '),nl,        
    write('            ###((((((//+///////////((((((((((((/(((####%%%/         '),nl,        
    write('            /(((////////((((((((((((((((((/++,++/##%%%%#%++        '),nl,         
    write('           +//////+,,/(#((((#####(((((((##((///((,+++++++++        '),nl,         
    write('         #&&//////++++++++++,,,,,,,,,,++++++,,,,++,,,,++++((&      '),nl,         
    write('         +,+,(/////+++++++++,,,....,,,,,,,,,,,,,,,,,++,++++,,+    '),nl,          
    write('             /+++////////+++++++,,,,++++++++++++++,,,,#%+++,,      '),nl,         
    write('             //++++++++++,,.,.,......,,,,,.,,,,,,,,,+,,,/            '),nl,       
    write('              /+++,/++,,,,/+,.. .  .+,,.,,...#,,,,,,+,,,,            '),nl,       
    write('              /+++,/++,,,,//,..   .(+,,,,,,,//,,,,,++,,,,            '),nl,       
    write('              +(+++(+++,,,//,..   ./,+.,,,,,/+.,,,,/+,,,.          '),nl,         
    write('              +/+++((++,,,//+..   ./,+.,,,,,//,,,,,/,,,(            '),nl,        
    write('              +++++((++,,,//+...  ./,/.,,,,,//,,,,,/,,,/          '),nl,          
    write('               +++++(+++,,///...  ./,/,,,,,,+(,,,,,(,,,,        '),nl,            
    write('               +++++(+++,,++(.... ./,+,,,,,,/(,,,,,/,,,+       '),nl,             
    write('               +(++,(+++,,++(....../+/,,,,,,/(,,,,,/,,+        '),nl,             
    write('               ,/+++(++,,,++(,...../++,,,,,,//,,,,/+,,/         '),nl,            
    write('                /,+,(+,+,,,/(,...../++,,,,,+//,.,.++,.+      '),nl,            
    write('                ,/+++(+++,,((,,..../++,,,,,//+,,,,/,,+     '),nl,                 
    write('                ,/++,(,,,,,((,,,.../++,,,,,//,,,,,/,,(   '),nl,              
    write('                 /+++(++,,,(/,,,,..//+,,,,,/(,,,,+/,,+    '),nl,                  
    write('                 ++++(/+,,,//,,,,,,//,,,,,,/(,,,,(+,,    '),nl,                   
    write('                ..(++/(++,+//+,,,,,(/,,,,,,/(,,,,(,,/.. '),nl,                    
    write('              ....++++#+++++(/,,,,,(/,,,,,,/+,,,,/,+/... '),nl,                   
    write('              ...,+///(+++++(/,,,,,((,,,,,,(,,,,,++/,...  '),nl,                  
    write('               ...,,/(//++++++++++++(,,,,+++++++/++,...   '),nl,                  
    write('                 ....,,+(//+/,//+,+++++++/+/+//+,....     '),nl,                  
    write('    .                ........,,,+++,++,,,,..,...        '),nl,                    
    write('                                .... .       .        '),nl,
    write('|--------------------------------------------|'),nl,
    write('|             You sure ? Okay.               |'),nl,
    write('|          Here\'s what you have :            |'),nl,
    write('|--------------------------------------------|'),nl,nl,
    write('Your Inventory'), nl, nl,
    showEquipments,
    itemList(Items),
    showItems(Items),nl,
    write('What do you want to throw?'), nl,
    write('> '),
    read(Choice),nl,
    (member([Choice, Sum], Items) ->
        write('You have '), write(Sum), write(' '), write(Choice),nl,
        write('|--------------------------------------------|'),nl,
        write('|           Now how much to throw ?          |'),nl,
        write('|--------------------------------------------|'),nl,
        write('> '),
        read(Count), nl,
        ( Count < 1 ->
            write('|--------------------------------------------|'),nl,
            write('|        Wrong input :( Canceling ....       |'),nl,
            write('|--------------------------------------------|'),nl
        ; Sum > Count ->
            NewSum is Sum - Count,
            delete(Items, [Choice, Sum], TempItems),
            append(TempItems, [[Choice, NewSum]], NewItems),
            retract(itemList(Items)),
            assertz(itemList(NewItems)),
            delInventory(Count),
            write('You threw away '), write(Count), write(' '), write(Choice)
        ; Count = Sum ->
            delete(Items, [Choice, Sum], NewItems),
            retract(itemList(Items)),
            assertz(itemList(NewItems)),
            delInventory(Count),
            write('You threw away '), write(Count), write(' '), write(Choice)
        ;
            write('You do not have enough '), write(Choice), write('. Cancelling...')
        )
    ;
        write('You do not have '), write(Choice), write(' in your inventory')
    ).


/* equipment(nama, level, terpakai atau tidak) */
/* 1 untuk terpakai, 0 untuk tidak */
:- dynamic(equipment/3).
equipment('Shovel', 1, 0).
equipment('Fishing Rod', 1, 0).

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

useEq(Name) :-
    equipment(Name, Lvl, Used),
    retract(equipment(Name, Lvl, Used)),
    assertz(equipment(Name, Lvl, 1)), 
    delInventory(1).

unequipEq(Name) :-
    equipment(Name, Lvl, Used),
    retract(equipment(Name, Lvl, Used)),
    assertz(equipment(Name, Lvl, 0)), 
    addInventory(1).

equip :-
    write('What do you want to use?'),nl,
    showEquipments,
    read(Choice),
    equipment(Choice, Lvl, Used),
    (Used = 1 ->
        write('Equipment is already used'),
        fail
        ;
    Used = 0 ->
        useEq(Choice),
        write(Choice), write(' is used.'),
        (\+ equipment(Choice, _, _)), equipment(Name, Lvl, 1),
        unequipEq(Name)
    ).

