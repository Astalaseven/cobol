       identification division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       program-id. fizzbuzz-recursive is recursive.

       data division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

       working-storage section.

       01 ct           pic 999.
       01 fz           pic 9       value 1.
       01 bz           pic 9       value 1.
       01 nb-recur     pic 999.

       01 fizzbuzz.
           03 fizz     pic x(4)    value "Fizz".
           03 buzz     pic x(4)    value "Buzz".

       linkage section.

       01 nb           pic 999.

      *>-----------------------------------
       procedure division using nb.

           if nb = 0 then
               goback
           end-if
       
           compute nb-recur = nb - 1
               on size error display "error while subtracting nb"
           end-compute

           call "fizzbuzz-recursive" using by content nb-recur

           if fz = 3 then
                if bz = 5 then

                    display fizzbuzz
                    compute bz = 0

                else

                    display fizz

                end-if

                compute fz = 0

           else
               if bz = 5 then

                   display buzz
                   compute bz = 0

               else

                   display nb

               end-if

           end-if

           add 1 to fz bz
               on size error display "error while adding 1 to fz bz"
           end-add

           goback.
