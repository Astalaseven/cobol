       identification division.
       program-id. calc.

       data division.

       working-storage section.

       01 ws-args.
           03 ws-fstnb             pic s9(9)v9(4)  usage packed-decimal.
           03 ws-oper              pic x.
               88 ws-addition                      value "+".
               88 ws-subtraction                   value "-".
               88 ws-multiplication                value "*" "x" ".".
               88 ws-division                      value "/".
               88 ws-modulo                        value "%".
           03 ws-sndnb             pic s9(9)v9(4)  usage packed-decimal.

       77 ws-fstnb-edt             pic -z(10)9.9(4).
       77 ws-sndnb-edt             pic -z(10)9.9(4).
       77 ws-total                 pic -z(18)9.9(4).

       77 ws-input                 pic x(80).
       77 ws-output                pic x(80).

       77 ws-error                 pic x           value "0".
           88 ws-critical                          value "1".


       procedure division.

       set ws-critical to true

       perform get-data.
       perform compute-result.
       perform display-result.

       goback.


       get-data.

           accept ws-input from argument-value

           unstring ws-input delimited by space
               into    ws-fstnb-edt
                       ws-oper
                       ws-sndnb-edt
           end-unstring

           compute ws-fstnb = function numval(ws-fstnb-edt)
               on size error
                   move "first arg cannot be processed (too big?)"
                       to ws-output
                   call "error-handler" using by content
                           ws-output ws-error
           end-compute

           compute ws-sndnb = function numval(ws-sndnb-edt)
               on size error
                   move "second arg cannot be processed (too big?)"
                       to ws-output
                   call "error-handler" using by content
                           ws-output ws-error
           end-compute
           .

       compute-result.

           evaluate true
       
               when ws-addition
                   compute ws-total = ws-fstnb + ws-sndnb
                       on size error
                           move "error during addition"
                               to ws-output
                           call "error-handler" using by content
                               ws-output ws-error
                   end-compute
       
               when ws-subtraction
                   compute ws-total = ws-fstnb - ws-sndnb
                       on size error
                           move "error during subtraction"
                               to ws-output
                           call "error-handler" using by content
                               ws-output ws-error
                   end-compute

               when ws-multiplication
                   compute ws-total = ws-fstnb * ws-sndnb
                       on size error
                           move "error during multiplication"
                               to ws-output
                           call "error-handler" using by content
                               ws-output ws-error
                   end-compute
       
               when ws-division
                   compute ws-total = ws-fstnb / ws-sndnb
                       on size error
                           move "error during division"
                               to ws-output
                           call "error-handler" using by content
                               ws-output ws-error
                   end-compute

               when ws-modulo
                   compute ws-total = function mod(ws-fstnb ws-sndnb)
                       on size error
                           move "error during modulo"
                               to ws-output
                           call "error-handler" using by content
                               ws-output ws-error
                   end-compute

               when other
                   move "sorry, unknown operator"
                       to ws-output
                   call "error-handler" using by content
                       ws-output ws-error

           end-evaluate
           .


       display-result.
           
           move ws-fstnb to ws-fstnb-edt
           move ws-sndnb to ws-sndnb-edt

           string
               ws-fstnb-edt space ws-oper space ws-sndnb-edt
               " = " ws-total into ws-output
               on overflow display "error in string operation"
           end-string

           display ws-output
           .
