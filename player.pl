/*:-include('start.pl').
*/
explvl(100).
explvlfarm(50).
explvlfish(50).
explvlranch(50).


/* naik level */
tambahExp(Exp1) :-
lvl(Lvl), explvl(Explvl), exp(Exp),
Exp+Exp1 < Lvl*Explvl, Exp2 is Exp+Exp1,
retract(exp(Exp)), asserta(exp(Exp2)), !.


tambahExp(Exp1) :-
lvl(Lvl), explvl(Explvl), exp(Exp),
Exp+Exp1 >= Lvl*Explvl, Exp2 is Exp+Exp1-Lvl*Explvl, naikLvl, write('Naik Level!!!\n'),
retract(exp(Exp)), asserta(exp(Exp2)), tambahExp(0),!.


tambahExpFarm(ExpFr1) :-
    lvlFarm(LvlFr), explvlfarm(ExplvlFr), expFarm(ExpFr),
    ExpFr+ExpFr1 < LvlFr*ExplvlFr, ExpFr2 is ExpFr+ExpFr1,
    retract(expFarm(ExpFr)), asserta(expFarm(ExpFr2)), !.

tambahExpFarm(ExpFr1) :-
    lvlFarm(LvlFr), explvlfarm(ExplvlFr), expFarm(ExpFr),
    ExpFr+ExpFr1 >= LvlFr*ExplvlFr, ExpFr2 is ExpFr+ExpFr1-LvlFr*ExplvlFr, naikLvlFr, write('Farming telah naik level!!!\n'),
    retract(expFarm(ExpFr)), asserta(expFarm(ExpFr2)), tambahExpFarm(0),!.


tambahExpFish(ExpFs1) :-
    lvlFish(LvlFs), explvlfish(ExplvlFs), expFish(ExpFs),
    ExpFs+ExpFs1 < LvlFs*ExplvlFs, ExpFs2 is ExpFs+ExpFs1,
    retract(expFish(ExpFs)), asserta(expFish(ExpFs2)), !.

tambahExpFish(ExpFs1) :-
    lvlFish(LvlFs), explvlfish(ExplvlFs), expFish(ExpFs),
    ExpFs+ExpFs1 >= LvlFs*ExplvlFs, ExpFs2 is ExpFs+ExpFs1-LvlFs*ExplvlFs, naikLvlFs, write('Fishing telah naik level!!!\n'),
    retract(expFish(ExpFr)), asserta(expFish(ExpFr2)),!.


tambahExpRanch(ExpRn1) :-
    lvlRanch(LvlRn), explvlranch(ExplvlRn), expRanch(ExpRn),
    ExpRn+ExpRn1 < LvlRn*ExplvlRn, ExpRn2 is ExpRn+ExpRn1,
    retract(expRanch(ExpRn)), asserta(expRanch(ExpRn2)), !.

tambahExpRanch(ExpRn1) :-
    lvlRanch(LvlRn), explvlranch(ExplvlRn), expRanch(ExpRn),
    ExpRn+ExpRn1 >= LvlRn*ExplvlRn, ExpRn2 is ExpRn+ExpRn1-LvlRn*ExplvlRn, naikLvlRn, write('Ranching telah naik level!!!\n'),
    retract(expRanch(ExpRn)), asserta(expRanch(ExpRn2)), tambahExpRanch(0),!.


/*stat dinamik*/
:-dynamic(exp/1).
:-dynamic(gold/1).
:-dynamic(lvl/1).
:-dynamic(lvlFarm/1).
:-dynamic(lvlFish/1).
:-dynamic(lvlRanch/1).
:-dynamic(expFarm/1).
:-dynamic(expFish/1).
:-dynamic(expRanch/1).

exp(0).
gold(0).
lvl(1).
lvlFarm(1).
lvlFish(1).
lvlRanch(1).
expFish(0).
expRanch(0).
expFarm(0).

naikLvl :- 
lvl(Lv),
Lvl is Lv+1,
retract(lvl(Lv)),
asserta(lvl(Lvl)),!.

naikLvlFr:-
    lvlFarm(LvFr),
    LvlFr is LvFr+1,
    retract(lvlFarm(LvFr)),
    asserta(lvlFarm(LvlFr)),!.

naikLvlFs:-
    lvlFish(LvFs),
    LvlFs is LvFs+1,
    retract(lvlFish(LvFs)),
    asserta(lvlFish(LvlFs)),!.

naikLvlRn:-
    lvlRanch(LvRn),
    LvlRn is LvRn+1,
    retract(lvlRanch(LvRn)),
    asserta(lvlRanch(LvlRn)),!.




/* bikin karakter */
createChara(A) :- retract(lvl(_)),asserta(lvl(0)), retract(class(_)), asserta(class(A)), naikLvl,!.

/* print stat */
status :- 
    write('Your status: '),nl,
    lvlFarm(LvlFr),expFarm(ExpFr), expFish(ExpFs), expRanch(ExpRn) , lvlFish(LvlFs), lvlRanch(LvlRn), 
    lvl(Lvl), class(A),
    exp(Exp) , gold(Gold), explvl(Explvl), Expmax is Explvl*Lvl,
    write('Job: '), write(A), write('\n'),
    write('Level: '), write(Lvl), write('\n'),
    write('Level Farming: '), write(LvlFr), write('\n'),
    write('Exp Farming: '), write(ExpFr), write('\n'), 
    write('Level Fishing: '), write(LvlFs), write('\n'), 
    write('Exp fishing: '), write(ExpFs), write('\n'),
    write('Level Ranching: '), write(LvlRn), write('/'), write(Expmax), write('\n'),
    write('Gold: '), write(Gold), !.

/*skema menang, tpi masih bingung ditaroh dimana nanti*/
winGame:-
    gold(Gold),
    Gold>=20000,
    write('Congratulations, you have become rich and won the game !!! '),nl.

