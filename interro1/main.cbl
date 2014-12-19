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
    03 ptr              pic x.
    03 chaine           pic x(80).
    
fd f-gon.
01 f-gon-out.
    03 gon              pic x(80).

*>****************************************

working-storage section.

77 entete               pic x(80).

77 name                 pic x(25) value "Doe".
77 surname              pic x(25) value "John".
77 str-ptr              pic 99    value 16.

*>****************************************

procedure division.

perform open-file.
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
    
    .

*>****************************************

close-file.
    close f-degres f-gon
    .
