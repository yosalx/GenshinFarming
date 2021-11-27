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
animal(0, cow).
animal(0, sheep).
animal(1, chicken).

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