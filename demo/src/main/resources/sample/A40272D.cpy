      ******************************************************************
      **                                                              **
      **      ACCOUNT BALANCE RESPONSE COPYBOOK                       **
      **                                                              **
      **       COBOL COPY BOOK     A40272D                            **
      **       DATA GROUP ID       840272                             **
      **                                                              **
      ******************************************************************
      *
       01  ACCTBALINQRS.
                 05 XSTATUS.
                    10 STATUSMESSAGE        PIC  X(40).
                    10 SEVERITY             PIC  X.
                 05 RS-ACCOUNTTYPE          PIC  X(03).
                 05 RS-ACCOUNTNUM           PIC  9(15) COMP-3.
                 05 RS-PRODUCT              PIC  X(40).
                 05 RS-ACCOUNTNAME          PIC  X(25).
                 05 RS-AVAILABLEBALANCE     PIC S9(11)V99 COMP-3.
                 05 RS-LEDGERBALANCE        PIC S9(11)V99 COMP-3.
                 05 RS-LINEAMOUNT           PIC S9(11)V99 COMP-3.
                 05 RS-LOANBALANCE          PIC S9(11)V99 COMP-3.
      *END OF COPYBOOK
