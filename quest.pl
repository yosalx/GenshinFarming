/*daftar quest dan reward.
#parameter quest: nomor, hasil panen, ikan, telur.
#parameter reward: nomor, exp, gold.*/
:- dynamic(quest/5).
quest(1,1,0,0,0).
quest(2,2,0,3,0).
quest(3,7,5,1,0).
quest(4,6,3,3,0).
quest(5,1,2,3,0).
quest(6,2,10,21,0).
quest(7,23,56,1,0).
quest(8,14,16,17,0).
quest(9,15,20,16,0).
quest(10,100,100,100,0).
reward(1,50,50).
reward(2,100,100).
reward(3,150,150).
reward(4,200, 200).
reward(5,250,250).
reward(6,300,300).
reward(7,350,350).
reward(8,400,400).
reward(9,450,450).
reward(10,500,500).
/*onQuest : apakah player masih dalam quest*/
:- dynamic(onQuest/1).
onQuest(0).
/*playerQuest : quest yg sedang diambil*/
:- dynamic(playerQuest/3).
playerQuest(0,0,0). 
/*quest : posisi player sedang di quest atau tidak */
:- dynamic(atquest/1).
:- dynamic(questNow/1).
atquest(0).
questNow(0).
:- dynamic(questisDone/1).
questisDone(0).
/*newQuest : 
1. Syarat : harus tidak dalam quest
2. questNow lanjut ke nomor quest selanjutnya
3. meng-assign quest dari daftar ke playerQuest*/
newQuest(A) :- 
    game_start(true),
    onQuest(0), 
    atquest(1),
    quest(A, B, C, D, _),
    questisDone(G),
    G+1 >= A,
    retract(questNow(_)), asserta(questNow(A)),
    retract(playerQuest(__,_,_)), asserta(playerQuest(B,C,D)), 
    retract(onQuest(0)), asserta(onQuest(1)),
    write('You got a new Quest'),!.
newQuest(_) :-
    game_start(false), !,
    write('Game has not been started yet!'),
    nl.
newQuest(_) :-
    atquest(0), !,
    write('You are not in a quest.'),
    nl,
    write('Type \'help\' to show usable.'),
    nl.
newQuest(A) :-
    questisDone(G),
    G+1 < A,
    write('Finish your quest first!'),!.
newQuest(_) :- 
    write('Finish your current quest first!!').
/*questDone
mengeset onQuest kembali nol
syarat : playerQuest harus sudah habis dan nomor quest tidak nol
reward diambil --> level up sama gold up*/
questDone :- 
    atquest(1),
    playerQuest(0,0,0),
    retract(onQuest(_)),
    asserta(onQuest(0)),
    questNow(Q), 
    reward(Q, C, D),
    Q > 0,
    questisDone(H),
    ((Q =< H) -> T is H ; T is H + 1),
    retract(questisDone(H)), asserta(questisDone(T)),
    quest(Q,R,L,Y,P),
    (((P is 0) -> (V is P + 1)) ; (V is P)),
    ((P is 0) -> asserta(quest(Q,R,L,Y,V)) ; write('')),
    ((P is 0) -> retract(quest(Q,R,L,Y,P)) ; write('')),
    /*rule level up sama gold up*/
    exp(A),
    F is A + C,
    retract(exp(A)),
    asserta(exp(F)),
    gold(E),
    G is E + D,
    retract(gold(E)),
    asserta(gold(G)).
    winGame.
/*questProgress mengurangi barang yg harus diambil*/
questProgress(yields) :- 
    playerQuest(A, B, C),
    A > 0,
    H is A - 1,
    retract(playerQuest(A,B,C)),
    asserta(playerQuest(H,B,C)),!.

questProgress(fish) :- 
    playerQuest(A, B, C),
    B > 0,
    H is B - 1,
    retract(playerQuest(A,B,C)),
    asserta(playerQuest(A,H,C)),!.

questProgress(egg) :- 
    playerQuest(A, B, C),
    C > 0,
    H is C - 1,
    retract(playerQuest(A,B,C)),
    asserta(playerQuest(A,B,H)),!.
questProgress(_).
questList :-
    atquest(1),
    quest(A,B,C,D,E),
    reward(A,F,G),
    write(A), write('. '), 
    write('yields : '), write(B),
    write(' | fish : '), write(C),
    write(' | egg : '), write(D),
    write(' | Reward : '), 
    write('+'), write(F), write(' EXP'),
    write(' and '), write('+'), write(G), write(' Gold '),
    isDone(E),
    nl, fail.    
isDone(X) :-
    X is 1,
    write('-----Done-----'),!.
isDone(X) :-
    write('').

questStat :- 
    playerQuest(A,B,C),
    write('yields : '), write(A), write(' remaining'),
    write(' | fish : '), write(B),write(' remaining'),
    write(' | egg : '), write(C),write(' remaining').
