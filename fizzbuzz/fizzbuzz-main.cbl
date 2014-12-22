       identification division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       program-id. fizzbuzz-main.

       data division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

       working-storage section.

       01 nb           pic 999999     value 100000.

      *>-----------------------------------
       procedure division.

           call "fizzbuzz-classic" using by content nb
           *> ./fizzbuzz-main  0,38s user 1,22s system 50% cpu 3,170 total
           call "fizzbuzz-recursive" using by content nb
           *> ./fizzbuzz-main  0,00s user 0,01s system 54% cpu 0,015 total

           goback.
