:- include('items.pl').

toMarket :-     write('|--------------------------------------------------|'),nl,
                write('|          Welcome To The Marketplace !            |'),nl,
                write('|            What do you want to do ?              |'),nl,
                write('|--------------------------------------------------|'),nl,
                write('|         1. BACK : I\'ll be back soon !            |'),nl,           
                write('|         2. BUY  : I want to buy some stuff !     |'),nl,
                write('|         3. SELL : I want to sell some stuff !    |'),nl,
                write('|--------------------------------------------------|'),nl,

                read(Choice),nl,

                (Choice = back ->
                    write('Okay, make sure to come back later !')
                    ;
                Choice = buy ->
                    write('|--------------------------------------------|'),nl,
                    write('|          What do you want to buy ?         |'),nl,
                    write('|--------------------------------------------|'),nl,
                    write('|         1. Carrot seed (50 golds)          |'),nl,
                    write('|         2. Corn seed (50 golds)            |'),nl,
                    write('|         3. Tomato seed (50 golds)          |'),nl,
                    write('|         4. Potato seed (50 golds)          |'),nl,
                    write('|         5. Chicken (500 golds)             |'),nl,
                    write('|         6. Sheep (1000 golds)              |'),nl,
                    write('|         7. Cow (1500 golds)                |'),nl,
                    write('|         8. Level 2 Shovel                  |'),nl,
                    write('|         9. Level 3 Fishing rod             |'),nl,
                    write('|--------------------------------------------|'),nl,

                    read_integer(Pick),nl,
                    (Pick = 1 ->

                        )
                    ;
                Choice = sell ->
                    write('|--------------------------------------------|'),nl,
                    write('|          What do you want to sell ?        |'),nl,
                    write('|--------------------------------------------|'),nl
                    /*Display item to sell*/
                ).


