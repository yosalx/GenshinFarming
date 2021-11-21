gettoMarket :-  write('Welcome to the shop adventurer!'), nl,
                write('what can i help you with?'),nl,

                write('|-----------------------------------------------|'),nl,
                write('|          Welcome To The Marketplace !         |'),nl,
                write('|-----------------------------------------------|'),nl,
                write(' 1. BACK : I\'ll be back soon !'),nl,
                write(' 2. BUY  : I want to buy some stuff !'),nl,
                write(' 3. SELL : I want to sell some stuff !'),nl,

                write('What do you want to do ?'),nl,
                read(Choice),nl

                (Choice = BACK ->
                    write('Okay, make sure to come back later !')
                    ;
                Choice = BUY ->
                    write('|--------------------------------------------|'),nl,
                    write('|          What do you want to buy ?         |'),nl,
                    write('|--------------------------------------------|'),nl,
                    /*Display item to buy*/
                    ;
                Choice = SELL ->
                    write('|--------------------------------------------|'),nl,
                    write('|          What do you want to sell ?        |'),nl,
                    write('|--------------------------------------------|'),nl,
                    /*Display item to sell*/
                ).


