       identification division.
       program-id. evaluate-example.
       
       data division.
       
       working-storage section.
       
       77 animal pic 9.
           88 chien        value 1.
           88 chat         value 2.
           88 poisson      value 3.
           88 serpent      value 4.
           88 requin       value 5.
       
       
       procedure division.
       
      *>************************************************
      *> evaluate sans utilisation des noms condition  *
      *>************************************************
       
           move 2 to animal
           perform evaluate-1.         *> mammifère
           
           move 5 to animal
           perform evaluate-1.         *> reptile

       
      *>************************************************
      *> evaluate avec utilisation des noms condition  *
      *>************************************************

           move 2 to animal
           perform evaluate-2.         *> animal
           
           move 5 to animal
           perform evaluate-2.         *> poisson


           goback.

       
       evaluate-1.

           evaluate animal
                when 1 thru 2   display "mammifère"
                *> not supported by OpenCobol 1.1.0
                *>when 3 also 5   display "poisson"
                when other      display "reptile"
           end-evaluate
           .

       evaluate-2.

           evaluate true
                when chien thru chat        display "mammifère"
                when poisson or requin      display "poisson"
                when any                    display "animal"
                when other                  display "pas animal"
           end-evaluate
           .
