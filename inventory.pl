/*:- include('item.pl').
*/
inventory :-
    totalInventory(Sum),
    Sum is 0,
    write('Inventory sementara kosong'), nl.

inventory :-
    totalInventory(Sum),
    Sum > 0,                                                                            
    write('                                    #@@@@@, '), nl,                                   
    write('                                ..@@@@@@@/..@@@@&,  '), nl,                            
    write('                        ,@@@@@@@@,       (@@@@@@@@@. '), nl,                        
    write('                    *@@@@@@@@        *@@@@@.      .@@@@@@.  '), nl,                  
    write('                    /@@@@@@      ,@@@@@,            ,@@@@@@  '), nl,                  
    write('                    /@@.,@@@@@@@@@/             &@@@@@@@@@@  '), nl,                  
    write('                    /@@.    @@@@@@@&.      /@@@@@@@@@@@@@@@  '), nl,                  
    write('                    /@@.    @@@. .&@@@@@@@@@@@@@@@@@@@@@@@@  '), nl,                  
    write('                    /@@.      (.      #@@@@@@@@@@@@@@@@@@@@  '), nl,                  
    write('                    /@@.              (@@@@@@@@@@@@@@@@@@@@  '), nl,                  
    write('                    /@@.              (@@@@@@@@@@@@@@@@@@@@ '), nl,                   
    write('                    /@@.  INVENTORY   (@@@@@@@@@@@@@@@@@@@@ '), nl,                   
    write('                    /@@.              (@@@@@@@@@@@@@@@@@@@@  '), nl,                  
    write('                    /@@(              (@@@@@@@@@@@@@@@@@@@@  '), nl,                  
    write('                .@@@@@@@@@@@@.         (@@@@@@@@@@@@@@@@@@@@@@@@@, '), nl,             
    write('        @@@@@@*      ,@@@@@@@@&     (@@@@@@@@@@@@@@@@&       .@@@@@,       '), nl,  
    write('    *@@@@@@.       (@@@@@@&.*@@@@@@@@*(@@@@@@@@@@@(        &@@@@@@/ .@@@@@, '), nl,   
    write('.@@@@#.       *@@@@@@@,          /@@@@@@@@@@@/        #@@@@@@#          ..@@@@.'), nl,
    write('&@@@@@@@*.@@@@@@@/            ,@@@@@@@@ @@@@@@@%./@@@@@@&.            (@@@@@@@,'), nl,
    write('&@@    &@@@@@             #@@@@@@@@@@@@ @@&   *@@@@@(            .@@@@@@@@@@@@,'), nl,
    write('&@@    ,@@@,@@@@@,   ,@@@@@@@@@@@@@@@@@ @@&    &@@%%@@@@@    %@@@@@@@@@@@@@@@@,'), nl,
    write('&@@     @@@     #@@@@@@@@@@@@@@@@@@@@@@ @@&    *@@.    .@@@@@@@@@@@@@@@@@@@@@@,'), nl,
    write('&@@               &@@@@@@@@@@@@@@@@@@@@ @@&               @@@@@@@@@@@@@@@@@@@@,'), nl,
    write('&@@               &@@@@@@@@@@@@@@@@@@@@ @@&               @@@@@@@@@@@@@@@@@@@@,'), nl,
    write('&@@  INVENTORY    &@@@@@@@@@@@@@@@@@@@@ @@&  INVENTORY    @@@@@@@@@@@@@@@@@@@@,'), nl,
    write('&@@               &@@@@@@@@@@@@@@@@@@@@ @@&               @@@@@@@@@@@@@@@@@@@@,'), nl,
    write('&@@               &@@@@@@@@@@@@@@@@@@@@ @@&               @@@@@@@@@@@@@@@@@@@@,'), nl,
    write('/@@@@&            &@@@@@@@@@@@@@@@@@@@& @@@@@(            @@@@@@@@@@@@@@@@@@@@ '), nl,
    write('    ,@@@@@(       &@@@@@@@@@@@@@@@/         (@@@@&.       @@@@@@@@@@@@@@@&.    '), nl,
    write('        #@@@@@,  &@@@@@@@@@@&.                 .&@@@@(   @@@@@@@@@@@/         '), nl,
    write('            .&@@@@@@@@@@*                           (@@@@@@@@@@&             '), nl, 
    write('                /@&                                     &@*                  '), nl,nl,
    write('Your inventory ('), write(Sum), write(' / 100)'), nl, nl,
    showEquipments,
    itemList(Items),
    showItems(Items),nl,
    write('|--------------------------------------------|'),nl,
    write('|             A hardworker eh ?              |'),nl,
    write('|--------------------------------------------|'),nl
    .

:- dynamic(totalInventory/1).
totalInventory(4).

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