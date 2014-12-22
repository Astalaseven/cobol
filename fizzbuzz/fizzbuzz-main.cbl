       identification division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       program-id. fizzbuzz-main.

       data division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

       working-storage section.

       01 nb           pic 999     value 100.

      *>-----------------------------------
       procedure division.

           call "fizzbuzz-classic" using by content nb
           call "fizzbuzz-recursive" using by content nb

           goback.
