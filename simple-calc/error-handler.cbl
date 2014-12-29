       identification division.
       program-id. error-handler.

       data division.

       linkage section.

       77 ls-message          pic x(80).
       77 ls-error            pic x    value "0".
           88 ls-critical              value "1".

       procedure division using ls-message ls-error.

       display ls-message
       display spaces
       display "usage: ./calc ""12345678.1234 + 12345678.1234"""

       if ls-critical then
           display "quitting."
           stop run
       end-if

       goback.
