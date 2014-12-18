identification division.
program-id. unstring-example.

data division.

working-storage section.

77 random-string            pic x(15) value "123ABCDEFGHIJKL".

77 ch1                      pic x(10).
77 ch2                      pic x(10).
77 ch3                      pic x(10).

77 delich1                  pic x(3).
77 delich2                  pic x(3).
77 delich3                  pic x(3).

77 countch1                 pic 9.
77 countch2                 pic 9.
77 countch3                 pic 9.

77 ptr                      pic 9 value 4.
77 countsplit               pic 9.

77 today-date               pic 9(8).
77 today-year               pic 9(4).
77 today-month              pic 99.
77 today-day                pic 99.

procedure division.

*>******************************************
*> unstring using different delimiters     *
*>******************************************

unstring
    random-string delimited by all "ABC" or "GHI"
    into ch1 delimiter in delich1 count in countch1
         ch2 delimiter in delich2 count in countch2
         ch3 delimiter in delich3 count in countch3
    with pointer ptr
    tallying in countsplit
    on overflow display "Pointer too low/high or not enough variables :("
end-unstring


display "Content 1 : " ch1 " (delimiter : " delich1 ", size : " countch1 ")"
display "Content 2 : " ch2 " (delimiter : " delich2 ", size : " countch2 ")"
display "Content 3 : " ch3 " (delimiter : " delich3 ", size : " countch3 ")"

display "Split number : " countsplit

*> Content 1 :            (delimiter : ABC, size : 0)                                                
*> Content 2 : DEF        (delimiter : GHI, size : 3)                                                
*> Content 3 : JKL        (delimiter :    , size : 3)
*> Split number : 3

*>******************************************
*> unstring using recepting variables size *
*>******************************************

move function current-date(1:8) to today-date

unstring
    today-date
    into today-year
         today-month
         today-day
end-unstring

display "Today: " today-day "/" today-month "/" today-year

*> Today: 18/12/2014

goback.
