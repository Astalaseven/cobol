identification division.

program-id. entete.

data division.

working-storage section.

01 identite.
    03 nom                  pic x(25).
    03 prenom               pic x(25).
    
01 today-date.
    03 t-year               pic x(4).
    03 t-month              pic x(2).
    03 t-day                pic x(2).

77 structure                pic X.
    88 accepted             value "o".
    88 no-struct            value "n".
    

linkage section.

77 ptr                      pic 99.
77 surname                  pic x(25).
77 name                     pic x(25).
77 entete                   pic x(132).
    
procedure division using name surname ptr entete.

*>*****************************************************
*> string with date from `function current-date(1:8)` *
*> (or from `accept date` if structs are authorized   *
*>*****************************************************

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
    surname     delimited by space
    space       delimited by size
    name        delimited by space
    " on "
    t-day
    "/"
    t-month
    "/"
    t-year      delimited by size
    into entete with pointer ptr
    on overflow display "Error in string operation"
end-string

goback.