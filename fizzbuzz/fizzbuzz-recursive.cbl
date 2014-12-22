       identification division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       program-id. fizzbuzz-recursive is recursive.

       data division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

       working-storage section.

       01 ct           pic 999.
       01 fz           pic 999     value 1.
       01 bz           pic 999     value 1.
       01 nb-recur     pic 999.

       linkage section.

       01 nb           pic 999.

      *>-----------------------------------
       procedure division using nb.

           if nb = 0 then
               goback
           end-if
       
           compute nb-recur = nb - 1
           call "fizzbuzz-recursive" using by content nb-recur

           if fz = 3 then
                if bz = 5 then

                    display "FizzBuzz"
                    move 0 to bz
                    
                else
       
                    display "Fizz"
       
                end-if
                
                move 0 to fz

           else
               if bz = 5 then

                   display "Buzz"
                   move 0 to bz

               else

                   display nb

               end-if

           end-if

           add 1 to fz bz

           goback.
