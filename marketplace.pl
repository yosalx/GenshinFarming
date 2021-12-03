/*:- include('ranching.pl').
:- include('inventory.pl').
:- include('farming.pl').
:- include('fishing.pl').
*/
:- dynamic(potion/1).
potion(2).

toMarket :-     
            write('             /  \\       __________________________/  \\____'),nl,
            write('            / ^^ \\     /=========================/ ^^ \\===|'),nl,
            write('           /  []  \\   /=========================/  []  \\==|'),nl,
            write('          /________\\ /=========================/________\\=|'),nl,
            write('       *  |        | /==========================|         |=|'),nl,
            write('      *** | ^^  ^^ | ---------------------------| ^^  ^^  |--'),nl,
            write('     *****| []  [] |            ______          | []  []  | |'),nl,
            write('    *******        |           |MARKET|         |      *  | |'),nl,
            write('   *********^^  ^^ |   ^^  ^^  |______|  ^^  ^^ |     *** | |'),nl,
            write('  ***********]  [] |   []  []  |  |   |  []  [] | ===***** |'),nl,
            write(' *************     |          @|__|__ |@        |/ |*******|'),nl,
            write('***************   ***********--=====--**********| *********'),nl,
            write('***************___*********** |=====| **********|***********'),nl,
            write(' *************     ********* /=======\\******** | *********'),nl,
            market
            .

market :-
            write('|--------------------------------------------------|'),nl,
            write('|          Welcome To The Marketplace !            |'),nl,
            write('|            What do you want to do ?              |'),nl,
            write('|--------------------------------------------------|'),nl,

            write('|--------------------------------------------------|'),nl,
            write('|         1. exit : I\'ll be back soon !            |'),nl,           
            write('|         2. buy  : I want to buy some stuff !     |'),nl,
            write('|         3. sell : I want to sell some stuff !    |'),nl,
            write('|--------------------------------------------------|'),nl,

            read(Choice),nl,

            (Choice = exit ->
                exit
                ;
            Choice = buy ->
                buy,market
                ;
            Choice = sell ->
                sell,market
                ;
                write('|--------------------------------------------------|'),nl,
                write('|            What ? I Don\'t Understand            |'),nl,
                write('|--------------------------------------------------|'),nl,
                market
            ).

buy :-
    atMarketplace(1),
    write('|--------------------------------------------|'),nl,
    write('|          What do you want to buy ?         |'),nl,
    write('|--------------------------------------------|'),nl,
    write('| 1. Carrot seed (50 golds)                  |'),nl,
    write('| 2. Corn seed (50 golds)                    |'),nl,
    write('| 3. Tomato seed (50 golds)                  |'),nl,
    write('| 4. Potato seed (50 golds)                  |'),nl,
    write('| 5. Strawberry seed (50 golds)              |'),nl,
    write('| 6. Chicken (500 golds)                     |'),nl,
    write('| 7. Sheep (1000 golds)                      |'),nl,
    write('| 8. Cow (1500 golds)                        |'),nl,
    write('| 9. Up 1 Level for Shovel (500 golds)       |'),nl,
    write('| 10. Up 1 level for Fishing Rod (500 golds) |'),nl,
    write('| 11. Psssttttt......                        |'),nl,
    write('|--------------------------------------------|'),nl,

    gold(Money),
    read_integer(Pick),nl,
    (Pick = 1 ->
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        ( Money >= Seedamount * 50 ->
        addseed(Seedamount, wortel),
        N is Seedamount * 50,
        updateMoney_buy(N),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 2 -> 
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        ( Money >= Seedamount * 50 ->
        addseed(Seedamount, jagung),
        N is Seedamount * 50,
        updateMoney_buy(N),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 3 -> 
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        ( Money >= Seedamount * 50 ->
        addseed(Seedamount, tomat),
        N is Seedamount * 50,
        updateMoney_buy(N),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 4 ->
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        ( Money >= Seedamount * 50 ->
        addseed(Seedamount, kentang),
        N is Seedamount * 50,
        updateMoney_buy(N),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 5 ->
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        ( Money >= Seedamount * 50 ->
        addseed(Seedamount, stroberi),
        N is Seedamount * 50,
        updateMoney_buy(N),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 6 ->
        ( Money >= 500 -> 
        addanimal(1, chicken),
        write('|--------------------------------------------|'),nl,
        write('|  Cock-A-Doodle-Doo !! Here\'s the chicken   |'),nl,
        write('|--------------------------------------------|'),nl,nl,
        updateMoney_buy(500);
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 7 ->
        ( Money >= 1000 ->
        addanimal(1, sheep),
        write('|--------------------------------------------|'),nl,
        write('|        Mbeeee !! Here\'s the sheep .        |'),nl,
        write('|--------------------------------------------|'),nl,nl,
        updateMoney_buy(1000);
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 8 ->
        ( Money >= 1500 ->
        addanimal(1, cow),
        write('|--------------------------------------------|'),nl,
        write('|          Mmoooo !! Here\'s the cow .        |'),nl,
        write('|--------------------------------------------|'),nl,nl,
        updateMoney_buy(1500);
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
    Pick = 9 ->
        ( Money >= 500 ->
        equipment('Shovel', A, _),
        (A is 1 ->
            retract(equipment('Shovel', A, _)),
            assertz(equipment('Shovel', 2, _)),
            updateMoney_buy(500),
            write('|--------------------------------------------|'),nl,
            write('|       There you go, work hard okay !       |'),nl,
            write('|--------------------------------------------|'),nl,nl
        ;
        A is 2 ->
        write('|--------------------------------------------|'),nl,
        write('|         Well, a hardworker aint ya         |'),nl,
        write('|    But sorry thats the best you can have   |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        );
    Pick = 10 ->
        ( Money >= 500 ->
        equipment('Fishing Rod', A, _),
        (A is 1 ->
            retract(equipment('Fishing Rod', A, _)),
            assertz(equipment('Fishing Rod', 2, _)),
            updateMoney_buy(500),
            write('|--------------------------------------------|'),nl,
            write('|       There you go, work hard okay !       |'),nl,
            write('|--------------------------------------------|'),nl,nl
        ;
        A is 2 ->
        write('|--------------------------------------------|'),nl,
        write('|         Well, a hardworker aint ya         |'),nl,
        write('|    But sorry thats the best you can have   |'),nl,
        write('|--------------------------------------------|'),nl,nl
        )
        ;
        write('|--------------------------------------------|'),nl,
        write('|        Hmmm , not enough money : (         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        );
    Pick = 11 ->
        write('                            Jgy__'),nl,
        write('                        jWW  ^^9Wf'),nl,
        write('                    _#WWW     IW'),nl,
        write('                    jWWWWW     IW'),nl,
        write('            __,yyyyyWWWWW     IWyyyy___'),nl,
        write('        _jyWWP"^^^^.C"9*,J _.mqD:^^"WWWWWWQg__^'),nl,
        write('      jgW"^.C/"    .C^     I    `D.     ^D._"WQg_'),nl,
        write('     jWP` .C"       C^      I     `D._     `D._ "Qg_'),nl,
        write('   jQP`  .C    ,d^^b._      I      _.d^^b.   `D._ "Qg'),nl,
        write('  jQ^  .C"   /`   .+" )     I     / "+.   `))   `D.  XQ'),nl,
        write(' jQ^  .C^   |`  ."    )    _I    (     ".  )    `D.  4#'),nl,
        write(' Qf  .C     (   (    /    / /\\   (     )  )     `D.  Qg'),nl,
        write('jW   C^     (____.+^    / /  \\    `+._/__/       `D  jQ'),nl,
        write('Qf   C         C        /_/    \\         D         D   Qk'),nl,
        write('Qf   C      _  C        \\_\\____/         D  _      D   QF'),nl,
        write('QL   C      \\^+.__     _______     ______.+^/      D   QF'),nl,
        write('B&   C.      \\   \\|    ||     |    ||      /       D   Qf'),nl,
        write('jQ   `C.      \\   |____|/     |____|/__   /      .D^   jW'),nl,
        write(' TQ   `C.      \'_   `+.__________/___/|_/      .D^   jQ`'),nl,
        write('  9Q   `C.      C.`+._           |   |/.D^     .D^   jQ'),nl,
        write('   "Qg  `C.     `C.   `"+-------^   ^ .D^     .D^   pW`'),nl,
        write('    ^WQy `C.     `C.        I        .D^    _.D^ yW"'),nl,
        write('      ^9Qy_`C.    `C.       I       .D^   _.D jgW"'),nl,
        write('         `9WQgC.__ `C.      I      .D^  _.Dp@@"`'),nl,
        write('             `""9WQQggyyyyyygyyyyyQggQWQH""'),nl,
        write('|----------------------------------------------------------|'),nl,
        write('|               Hey thereee, yes youu                      |'),nl,
        write('|          I\'m the legendary talking pumpkin               |'),nl,
        write('|    I used to be the main alchemist of this nation        |'),nl,
        write('|                          ....                            |'),nl,
        write('| Anyway do you want to buy my secret potion (1000 coin) ? |'),nl,
        write('|----------------------------------------------------------|'),nl,
        read(Potion_Choice),nl,
        (Potion_Choice = yes ->
            potion(X),
            (Money >= 1000 ->
            ( X > 0 -> 
            write('|----------------------------------------------------|'),nl,
            write('|      What a good choiceeee, this potion is rare    |'),nl,
            write('|              p.s. if you want tou use it           |'),nl,
            write('|             say the magic word okay ;)             |'),nl,
            write('|                    (usePotion.)                    |'),nl,
            write('|----------------------------------------------------|'),nl,
            NewSum is X - 1,
            retract(potion(X)),
            assertz(potion(NewSum)),
            addItem('Secret potion',1),
            updateMoney_buy(1000)
            ;
            write('|--------------------------------------------------|'),nl,
            write('|      Ohohoho do not be greedy oh young one       |'),nl,
            write('|--------------------------------------------------|'),nl
            );
            write('|--------------------------------------------|'),nl,
            write('|        Hmmm , not enough money : (         |'),nl,
            write('|--------------------------------------------|'),nl,nl
            );
        Potion_Choice = no ->
            write('|----------------------------------------------------|'),nl,
            write('|       Okay then, do not regret this okay...        |'),nl,
            write('|----------------------------------------------------|'),nl
        )
    )
    .

buy :- 
    /* ini kalo atMarketplace(0)*/
    write('|----------------------------------------------------|'),nl,
    write('|      You are not at the market right now T^T       |'),nl,
    write('|----------------------------------------------------|'),nl
    .

sell :-
    atMarketplace(1),
    write('|----------------------------------------------------|'),nl,
    write('|          Oh you want to sell me something ?        |'),nl,
    write('|              What dou you have here ?              |'),nl,
    write('|----------------------------------------------------|'),nl,
    itemList(Items),nl,
    showItems(Items),nl,
    write('|----------------------------------------------------|'),nl,
    write('|              Wow, as expected of you !             |'),nl,
    write('|            Now what do you want to sell ?          |'),nl,
    write('|----------------------------------------------------|'),nl,
    read(Sell_choice),
    (Sell_choice = wool-> 
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Wool',Sellamount ),
        New is (Sellamount * 150),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = milk-> 
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        New is (Sellamount * 200),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = egg -> 
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Egg',Sellamount),
        New is (Sellamount * 100),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = tuna ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Tuna',Sellamount),
        New is (Sellamount * 250),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = salmon ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Salmon',Sellamount),
        New is (Sellamount * 230),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = gurame ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Gurame',Sellamount),
        New is (Sellamount * 210),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = tongkol ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Tongkol',Sellamount),
        New is (Sellamount * 200),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = lele ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Lele',Sellamount),
        New is (Sellamount * 150),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = wortel ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Wortel',Sellamount),
        New is (Sellamount * 60),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = kentang ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Kentang',Sellamount),
        New is (Sellamount * 70),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = tomat ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Tomat',Sellamount),
        New is (Sellamount * 80),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = stroberi ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Stroberi',Sellamount),
        New is (Sellamount * 90),
        updateMoney_sell(New),
        winGame
    ;
    Sell_choice = jagung ->
        write('|--------------------------------------------|'),nl,
        write('|       How many do you want to sell ?       |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Sellamount),
        useItem('Jagung',Sellamount),
        New is (Sellamount * 110),
        updateMoney_sell(New),
        winGame
    ;
    write('|--------------------------------------------|'),nl,
    write('|          There\'s no such item...          |'),nl,
    write('|--------------------------------------------|'),nl
    )
    .

sell :- 
    /* ini kalo atMarketplace(0)*/
    write('|----------------------------------------------------|'),nl,
    write('|      You are not at the market right now T^T       |'),nl,
    write('|----------------------------------------------------|'),nl
    .

updateMoney_buy(N):-
    gold(X),
    NewSum is X-N,
    retract(gold(X)),
    assertz(gold(NewSum)).

updateMoney_sell(N):-
    gold(X),
    NewSum is X+N,
    retract(gold(X)),
    assertz(gold(NewSum)).

writeMoney:-
    money(X),
    write('Money is'), write(X).

usePotion :-
    useItem('Secret potion', 1),
    class(X),nl,
    (X = fisherman ->
        tambahExp(40),
        tambahExpFish(40)
    ;

    X = farmer ->
        tambahExp(40),
        tambahExpFarm(40)
    ;
    X = rancher ->
        tambahExp(40),
        tambahExpRanch(40)
    ) .