identification division.
program-id. interro1.

*>****************************************

environment division.

input-output section.

file-control.
    select f-degres assign to "file-degres".
    select f-gon    assign to "file-gon".

*>****************************************

data division.

file section.
fd f-degres.
01 f-degres-in.
    03 ptr              pic 9.
    03 str              pic x(30).
    
fd f-gon.
01 f-gon-out.
    03 gon              pic x(80).

*>****************************************

working-storage section.

77 entete               pic x(80).

77 name                 pic x(25) value "Doe".
77 surname              pic x(25) value "John".
77 str-ptr              pic 99    value 16.

77 celsius-edt          pic x(8).
77 celsius              pic 999v9999.

77 conversion-str       pic x(80).

77 f-eof                pic x     value "1".
    88 eof                        value "0".

*>****************************************

procedure division.

perform open-file.
perform conversion until eof.
perform close-file.

goback.


*>****************************************

open-file.
    open input f-degres
        output f-gon
        
    call "entete" using by content name surname str-ptr
                        by reference entete

    move entete to f-gon-out
    write f-gon-out
    
    read f-degres
        at end set eof to true
        not at end display "not eof"
    end-read
    .

*>****************************************

conversion.
    
    string
        "conversion of --> "    delimited by size
        str                     delimited by space
        " <-- with pointer "    delimited by size
        ptr                     delimited by space
        into conversion-str
    end-string
    
    display conversion-str

    unstring 
        str
        into celsius-edt
        with pointer ptr
    end-unstring
    
    move function numval(celsius-edt) to celsius
    
    display celsius
    display spaces
    display spaces
    
    initialize f-degres-in
    
    read f-degres
        at end set eof to true
        not at end display "not eof"
    end-read
    .

*>****************************************

close-file.
    close f-degres f-gon
    .
