/*:- include('inventory.pl').
:- include('player.pl').
:- include('start.pl').
:- include('house.pl').
*/
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

/*
:- dynamic(day/1).
day(3).
*/

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
    asserta(animal(NewSum, Name)),!.

/*decreaseanimal(N, Name) :-    
    animal(Sum),
    NewSum is Sum - N,
    retract(animal(Sum)),
    asserta(animal(NewSum, Name)).*/

addExpRanching :-
    class(X),
    (X = fisherman -> 
        tambahExpRanch(20),
        tambahExp(20),
        write('You gained 20 exp !'), nl;
        tambahExpRanch(15),
        tambahExp(15),
        write('You gained 15 exp !'), nl
    ).


cow :-
    /*atRanch(1),*/
    animal(Sum, cow),
    lvlRanch(Level),
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
            addItem('Milk',Count),
            write('Your cow(s) produce '), write(Count), write(' milk(s) !'),nl,
            write('|--------------------------------------------|'),nl,
            write('|             Enjoy the milk !               |'),nl,
            write('|--------------------------------------------|'),nl,nl,
            addExpRanching
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
    lvlRanch(Level),
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
            addItem('Wool',Count),
            write('Your sheep(s) produce '), write(Count), write(' wool(s) !'),nl,
            write('|--------------------------------------------|'),nl,
            write('|             Here\'s the wool !              |'),nl,
            write('|--------------------------------------------|'),nl,nl,
            addExpRanching
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
    /*atRanch(1),*/
    animal(Sum, chicken),
    lvlRanch(Level),
    day(X),
    ( Sum is 0 ->
        write('|------------------------------------------------|'),nl,
        write('|       Eh.... you have no chicken you know ?    |'),nl,
        write('|------------------------------------------------|'),nl
        ;
    Sum > 0 ->
        product(egg, 2),
        (0 is X mod 2 ->
            Count is (Sum * Level),
            addItem('Egg',Count),
            write('Your chicken(s) produce '), write(Count), write(' egg(s) !'),nl,
            write('|--------------------------------------------|'),nl,
            write('|              Enjoy the egg !               |'),nl,
            write('|--------------------------------------------|'),nl,nl,
            addExpRanching
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