       identification division.
       program-id. inspect-example.
       
       data division.
       
       working-storage section.
       
       77 random-string            pic x(6) value "123ABC".
       
       procedure division.
       
           display random-string
      *> 123ABC
           
           perform inspect-1.
           display "inspect 1 : " random-string
      *> ******

       move "123123123" to random-string
       
           perform inspect-2.
           display "inspect 2 : " random-string
      *> 333123
           
           perform inspect-3.
           display "inspect 3 : " random-string
      *> 334444
           
           perform inspect-4.
           display "inspect 4 : " random-string
      *> 334344
           
           perform inspect-5.
           display "inspect 5 : " random-string
      *> 444344
           
           perform inspect-6.
           display "inspect 6 : " random-string
      *> 222322

           goback.

       inspect-1.
           inspect random-string
                replacing characters by "*"
           .

       inspect-2.
           inspect random-string
                replacing characters by "3" before initial "3"
           .

       inspect-3.
           inspect random-string
                replacing characters by "4" after "33"
           .
       
       inspect-4.
           inspect random-string
                replacing first "4" by "3"
                after initial "4"
           .
       
       inspect-5.
           inspect random-string
                replacing leading "3" by "4".
           .
       
       inspect-6.
           inspect random-string
                replacing all "4" by "2"
                          all "2" by "3"
           .
