toRanch :-  write(''),nl,
            write('.########.....###....##....##..######..##.....##'),nl,
            write('.##.....##...##.##...###...##.##....##.##.....##'),nl,
            write('.##.....##..##...##..####..##.##.......##.....##'),nl,
            write('.########..##.....##.##.##.##.##.......#########'),nl,
            write('.##...##...#########.##..####.##.......##.....##'),nl,
            write('.##....##..##.....##.##...###.##....##.##.....##'),nl,
            write('.##.....##.##.....##.##....##..######..##.....##'),nl,
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


:- dynamic(animal/2).
animal(1, cow).
animal(1, sheep).
animal(1, chicken).

showanimal :-
forall((animal(Sum, Name)), (listanimal(Sum, Name)))
    .

listanimal(Sum, Name) :-
    Sum > 0,
    write(' >'), write(Sum), write(' '), write(Name),nl
    . 

addanimal(N, Name) :-
    animal(Sum, Name),
    NewSum is Sum + N,
    retract(animal(Sum)),
    asserta(animal(NewSum)).

decreaseanimal(N, Name) :-    
    animal(Sum),
    NewSum is Sum - N,
    retract(animal(Sum)),
    asserta(animal(NewSum)).