       identification division.
       program-id. string-example.
       
       data division.
       
       working-storage section.
       
       01 identite.
           03 nom          pic x(25).
           03 prenom       pic x(25).

       01 today-date.
           03 t-year       pic x(4).
           03 t-month      pic x(2).
           03 t-day        pic x(2).

       77 non-integer      pic S999v99999  value 3.14159.
       77 pi-edit          pic x(50).

       77 signed-integer   pic S99         value +42.

       77 begin-string     pic 99          value 13.
       77 entete           pic x(132).

       77 structure        pic X           value "n".
           88 accepted                     value "o".

       procedure division.
       
      *>*****************************************************
      *> string with date from `function current-date(1:8)` *
      *> (or from `accept date` if structs are authorized)  *
      *>*****************************************************
       
       move "Doe"  to nom
       move "John" to prenom
       
      *> by default structures are not authorized, let's change this
       set accepted to true
       
       if accepted then

           accept today-date from date YYYYMMDD

       else

           move function current-date(1:4) to t-year
           move function current-date(5:2) to t-month
           move function current-date(7:2) to t-day

       end-if
       
       string
           prenom          delimited by space
           space           delimited by size
           nom             delimited by space
           " on "
           t-day
           "/"
           t-month
           "/"
           t-year          delimited by size
           into entete     with pointer begin-string
           on overflow     display "Error in string operation"
       end-string
       
       display spaces
       
       display entete                  *> "            John Doe on 18/12/2014"
       
      *>*****************************************************
      *> cannot use non integer value in string operation   *
      *> (same goes for binary and packed-decimal)          *
      *> (works on OpenCobol 1.1.0 though...)               *
      *>*****************************************************
       
       string
           "PI is : "
           non-integer     delimited by size
           into            pi-edit
           on overflow     display "Error in string operation"
       end-string
       
       display pi-edit                 *> "PI is : 00314159"
       
       
      *>*****************************************************
      *> can use signed integer value in string operation   *
      *>*****************************************************
       
       string
           "Answer to life is : "
           signed-integer  delimited by size
           into            pi-edit
           on overflow     display "Error in string operation"
       end-string
       
       display pi-edit                 *> "Answer to life is : 42"
       
       
       goback.
