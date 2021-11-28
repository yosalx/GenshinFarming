:- include('ranching.pl').
:- include('item.pl').
:- include('farming.pl').

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
            write('|         1. Back : I\'ll be back soon !            |'),nl,           
            write('|         2. Buy  : I want to buy some stuff !     |'),nl,
            write('|         3. Sell : I want to sell some stuff !    |'),nl,
            write('|--------------------------------------------------|'),nl,

            read(Choice),nl,

            (Choice = back ->
                exit
                ;
            Choice = buy ->
                buy,market
                ;
            Choice = sell ->
                sell,market
            ).

buy :-
    atMarketplace(1),
    write('|--------------------------------------------|'),nl,
    write('|          What do you want to buy ?         |'),nl,
    write('|--------------------------------------------|'),nl,
    write('|         1. Carrot seed (50 golds)          |'),nl,
    write('|         2. Corn seed (50 golds)            |'),nl,
    write('|         3. Tomato seed (50 golds)          |'),nl,
    write('|         4. Potato seed (50 golds)          |'),nl,
    write('|         5. Strawberry seed (50 golds)      |'),nl,
    write('|         6. Chicken (500 golds)             |'),nl,
    write('|         7. Sheep (1000 golds)              |'),nl,
    write('|         8. Cow (1500 golds)                |'),nl,
    write('|         9. Up 1 Level for Shovel           |'),nl,
    write('|         10. Up 1 level for Fishing Rod     |'),nl,
    write('|--------------------------------------------|'),nl,

    read_integer(Pick),nl,
    (Pick = 1 ->
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        addseed(Seedamount, wortel),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 2 -> 
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        addseed(Seedamount, jagung),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 3 -> 
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        addseed(Seedamount, tomat),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 4 ->
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        addseed(Seedamount, kentang),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 5 ->
        write('|--------------------------------------------|'),nl,
        write('|     How many seed do you want to buy ?     |'),nl,
        write('|--------------------------------------------|'),nl,

        read_integer(Seedamount),
        addseed(Seedamount, stroberi),
        write('|--------------------------------------------|'),nl,
        write('|        Thanks ! Here\'s  the seed !         |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 6 ->
        addanimal(1, chicken),
        write('|--------------------------------------------|'),nl,
        write('|  Cock-A-Doodle-Doo !! Here\'s the chicken   |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 7 ->
        addanimal(1, sheep),
        write('|--------------------------------------------|'),nl,
        write('|        Mbeeee !! Here\'s the sheep .        |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 8 ->
        addanimal(1, cow),
        write('|--------------------------------------------|'),nl,
        write('|          Mmoooo !! Here\'s the cow .        |'),nl,
        write('|--------------------------------------------|'),nl,nl
        ;
    Pick = 9 -> write('Not implemented yet');
    Pick = 10 -> write('Not implemented yet')
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
    showItems,nl,
    showEquipments,nl,
    write('|----------------------------------------------------|'),nl,
    write('|              Wow, as expected of you !             |'),nl,
    write('|            Now what do you want to sell ?          |'),nl,
    write('|----------------------------------------------------|'),nl
    .

sell :- 
    /* ini kalo atMarketplace(0)*/
    write('|----------------------------------------------------|'),nl,
    write('|      You are not at the market right now T^T       |'),nl,
    write('|----------------------------------------------------|'),nl
    .
