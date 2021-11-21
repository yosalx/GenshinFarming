/* jenisitem(jumlah, nama item, ID item) */
:- dynamic(seeds/3).
seeds(0, Wortel, 1).
seeds(0, Tomat, 2).
seeds(0, Kentang, 3).
seeds(0, Jagung, 4).
seeds(0, S, stroberi).

:- dynamic(fish/3).
fish(0, Tuna, 1).
fish(0, Salmon, 2).
fish(0, Tongkol, 3).
fish(0, Lele, 4).
fish(0, Gurame, 5).

:- dynamic(dairy/3).
dairy(0, Susu, 1).
dairy(0, Telur, 2).
dairy(0, Wortel, 3).

:- dynamic (equipment/3).
/* equipment(nama, level, terpakai atau tidak) */
/* 1 untuk terpakai, 0 untuk tidak */
equipment(shovel, 1, 0).
equipment(fishingRod, 1, 0).
equipment(ranchingKit, 1, 0).