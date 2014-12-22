       identification division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       program-id. fizzbuzz-classic.

       data division.
      *>-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

       working-storage section.

       01 ct           pic 999.
       01 fz           pic 999     value 1.
       01 bz           pic 999     value 1.

       01 fizzbuzz.
           03 fizz     pic x(4)    value "Fizz".
           03 buzz     pic x(4)    value "Buzz".

       linkage section.

       01 nb           pic 999.

      *>-----------------------------------
       procedure division using nb.

           perform varying ct from 1 by 1 until ct > nb

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

                        display ct

                   end-if

               end-if

               add 1 to fz bz

           end-perform

           goback.
