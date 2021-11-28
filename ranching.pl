toRanch :-  write(''),nl,
            write('                           +&-          '),nl,
            write('                         _.-^-._    .--.'),nl,
            write('                      .-\'   _   \'-. |__|'),nl,
            write('                     /     |_|     \\|  |'),nl,
            write('                    /               \\  |'),nl,
            write('                   /|     _____     |\\ |'),nl,
            write('                    |    |==|==|    |  |'),nl,
            write('|---|---|---|---|---|    |==|==|    |  |'),nl,
            write('----------------------------------------'),nl,
            write('|------------------------------------------------|'),nl,
            write('|           Oh Hey you, you\'re back !            |'),nl,
            write('|  You want to take a look at your livestock ?   |'),nl,
            write('|                   You have :                   |'),nl,
            write('|------------------------------------------------|'),nl,nl,
            showanimal,nl,
            write('|------------------------------------------------|'),nl,
            write('|          Oh you want to collect the goods ?    |'),nl,
            write('|               From which animal ?              |'),nl,
            write('|------------------------------------------------|'),nl
. 



:- dynamic(animal/2). /*animal(Sum,Name)*/
animal(0, cow).
animal(0, sheep).
animal(1, chicken).
:- dynamic(product/3). /*product(Name,Time_Required)*/
product(milk, 5).
product(wool, 3).
product(egg, 2).

:- dynamic(day/1).
day(5).

:- dynamic(ranching/1).
ranching(1).

showanimal :-
forall((animal(Sum, Name)), (listanimal(Sum, Name)))
    .

listanimal(Sum, Name) :-
    (Sum > 0 ->
        write(Sum), write(' '), write(Name),nl;
    Sum is 0 ->
        write('')
    )
    . 

addanimal(N, Name) :-
    animal(Sum, Name),
    NewSum is Sum + N,
    retract(animal(Sum, Name)),
    asserta(animal(NewSum, Name)).

decreaseanimal(N, Name) :-    
    animal(Sum),
    NewSum is Sum - N,
    retract(animal(Sum)),
    asserta(animal(NewSum, Name)).


cow :-
    /*atRanch(1),*/
    animal(Sum, cow),
    ranching(Level),
    day(X), /*dummy for day, x is the number of day passed*/
    ( Sum is 0 ->
        write('|------------------------------------------------|'),nl,
        write('|       Eh.... you have no cow you know ?        |'),nl,
        write('|------------------------------------------------|'),nl
        ;
    Sum > 0 ->
        product(milk, 5),
        (0 is X mod 5 ->
            Count is (Sum * Level),
            addItem('milk',Count),
            write('lol')
        ;
        write('|------------------------------------------------|'),nl,
        write('|             Give your cow a rest !             |'),nl,
        write('|------------------------------------------------|'),nl
        )
    ),!
    .

cow :-
    write('|------------------------------------------------|'),nl,
    write('|     You are not in the ranch right now T^T     |'),nl,
    write('|------------------------------------------------|'),nl,!
    .

sheep :-
    /*atRanch(1),*/
    animal(Sum, sheep),
    ranching(Level),
    day(X),
    ( Sum is 0 ->
        write('|------------------------------------------------|'),nl,
        write('|       Eh.... you have no sheep you know ?      |'),nl,
        write('|------------------------------------------------|'),nl
        ;
    Sum > 0 ->
        product(wool, 3),
        (0 is X mod 3 ->
            Count is (Sum * Level),
            addItem('wool',Count),
            write('lol')
        ;
        write('|------------------------------------------------|'),nl,
        write('|           Give your sheep a rest !             |'),nl,
        write('|------------------------------------------------|'),nl
        )
    ),!
    . 

sheep :-
    write('|------------------------------------------------|'),nl,
    write('|     You are not in the ranch right now T^T     |'),nl,
    write('|------------------------------------------------|'),nl,!
    .

chicken :-
    atRanch(1),
    animal(Sum, chicken),
    ( Sum is 0 ->
        write('|------------------------------------------------|'),nl,
        write('|       Eh.... you have no chicken you know ?    |'),nl,
        write('|------------------------------------------------|'),nl
        ;
    Sum > 0 ->
        product(egg, 2),
        (0 is X mod 2 ->
            Count is (Sum * Level),
            addItem('egg',Count),
            write('lol')
        ;
        write('|------------------------------------------------|'),nl,
        write('|           Give your chicken a rest !           |'),nl,
        write('|------------------------------------------------|'),nl
        )
    ),!
    . 
chicken :-
    write('|------------------------------------------------|'),nl,
    write('|     You are not in the ranch right now T^T     |'),nl,
    write('|------------------------------------------------|'),nl,!
    .