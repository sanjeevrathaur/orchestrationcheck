       IDENTIFICATION DIVISION.
       PROGRAM-ID. A40212.
       AUTHOR.
      *CRT*************************************************************
      *CRV*      AID  VERSION 1  RELEASE 0  CST 0  MLU 0              *
      *CRT*************************************************************
      *CRT*  This software contains trade secrets and confidential    *
      *CRT*  information which are proprietary to Celeriti FinTech    *
      *CRT*  The use, reproduction, distribution, or disclosure       *
      *CRT*  of the software, in whole or in part, without            *
      *CRT*  the express written permission of Celeriti FinTech       *
      *CRT*  is prohibited.  This software is also an                 *
      *CRT*  unpublished work protected under the copyright laws of   *
      *CRT*  the United States of America and other countries.  If    *
      *CRT*  this software becomes published, the following notice    *
      *CRT*  shall apply:                                             *
      *CRY*      Copyright (C) 2016 Celeriti FinTech                  *
      *CRT*      All Rights Reserved.                                 *
      *CRT*************************************************************
       DATE-COMPILED.
      *****************************************************************
      * PROGRAM DESCRIPTION                                           *
      *****************************************************************
      *     PROGRAM INFORMATION:                                      *
      *         NAME:          A40212                                 *
      *                                                               *
      *     PROGRAM PURPOSE:                                          *
      *        ENTRY MODULE FOR ACCOUNT BALANCE - API                 *
      *                                                               *
      *      PRINCIPAL PROCESSING FUNCTIONS:                          *
      *      - RECEIVE THE INCOMING REQUEST IN CONTAINER              *
      *      - INVOKE CALLABLE PEM DRIVER                             *
      *      - POPULATE THE RESPONSE TO CONTAINER                     *
      *****************************************************************
           EJECT
       ENVIRONMENT DIVISION.
           EJECT
       DATA DIVISION.
           EJECT
       FILE                                 SECTION.
           EJECT
       WORKING-STORAGE                      SECTION.
      *
      * WORKING STORAGE VARIABLES
       01  WS-FIELDS.
           05 WS-VARIABLES.
              10 WS-COMMAND-RESP            PIC S9(8) BINARY.
              10 WS-COMMAND-RESP2           PIC S9(8) BINARY.
              10 WS-COUNT-1                 PIC 9(4)  BINARY.
              10 WS-ERROR                   PIC X(80).
              10 WS-ERROR-DATA.
                 15 WS-ERROR-MSG            PIC X(80).
                 15 WS-ROLLBACK-IND         PIC X.
              10 WS-CONTAINER-INFO.
                 15 WS-CURRENTCHANNELNAME   PIC X(16).
                 15 WS-RESPONSE-INITIALIZE  PIC X(131072).
      * REQUEST COPYBOOK LAYOUT
           05 WS-AFS-REQUEST.
              10 WS-APPL-FUNC-SOUR.
                 15 WS-APPL-ID              PIC S9(04)  COMP VALUE 842.
                 15 WS-FUNC-ID              PIC S9(04)  COMP VALUE 42.
                 15 WS-SOUR-ID              PIC S9(04)  COMP VALUE 3.
              10 WS-FILLER                  PIC X(31994).
      * REQUEST COPYBOOK LAYOUT FOR PROCESSING
           05 WS-API-REQUEST REDEFINES WS-AFS-REQUEST.
              10 FILLER                     PIC X(06).
              10 WS-REQUEST-LAYOUT.
                 15 WS-FILLER               PIC X(31994).
      * RESPONSE COPYBOOK LAYOUT FOR PROCESSING
           05 WS-RESPONSE-LAYOUT.
              10 WS-RESPONSE-FIELDS.
                 15 WS-XSTATUS.
                    20 WS-STATUSMESSAGE     PIC X(40).
                    20 WS-SEVERITY          PIC X(01).
                    20 WS-DETAILMESSAGES.
                       25 WS-PROPERTYNAME   PIC X(40).
                       25 WS-MSG-DESCRIPTION
                                            PIC X(40).
                 15 WS-FILLERS              PIC X(130951).
      *
      * CHARACTER CONSTANTS
           05 MISC-CONSTANTS.
              10 CC-Y                       PIC X(01) VALUE 'Y'.
              10 CC-E                       PIC X(01) VALUE 'E'.
              10 CC-PEMCL                   PIC X(8)
                                            VALUE 'A40200  '.
              10 CC-CICS-ERROR              PIC X(21) VALUE
                                            'INTERNAL SYSTEM ERROR'.
              10 CC-REQUEST-CONTNR          PIC X(16) VALUE
                                                   'OLREQ           '.
              10 CC-RESPONSE-CONTNR         PIC X(16) VALUE
                                                   'OLRESP          '.
              10 CC-CEL-CONTROL             PIC X(16) VALUE
                                                   'CEL-CONTROL     '.
      * BINARY CONSTANTS
              10 CH-1                       PIC S9(4) COMP VALUE +0001.
              10 CH-6                       PIC S9(4) COMP VALUE +0006.
              10 CH-42                      PIC S9(4) COMP VALUE +0042.
           EJECT
       LINKAGE                              SECTION.
           EJECT
       COPY A40242D.
       COPY A40272D.
           EJECT
       PROCEDURE DIVISION.

       AA000-HOUSEKEEPING                   SECTION.
      ***************************************************************
      *    THIS SECTION INITIALIZES THE VARIABLES                   *
      ***************************************************************
           INITIALIZE WS-COMMAND-RESP
                      WS-REQUEST-LAYOUT
                      WS-RESPONSE-LAYOUT
                      WS-API-REQUEST
                      WS-RESPONSE-INITIALIZE
                      WS-COMMAND-RESP2.
      *
      *HANDLE THE CICS ABENDS
           EXEC CICS HANDLE ABEND
             LABEL (WA000-CHECK-RESPONSE)
           END-EXEC

      *GET THE CURRENT CHANNEL
           EXEC CICS
             ASSIGN CHANNEL(WS-CURRENTCHANNELNAME)
             RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT
               .
       AA999-EXIT.
             EXIT.
           EJECT

       BA000-MAINLINE                       SECTION.
      ***************************************************************
      *    THIS SECTION IS THE MAIN-LINE PROCESSING FOR INVOKING    *
      *    THE CALLABLE  PEM MODULE SD0008C.                        *
      ***************************************************************
      *
           EXEC CICS GET CONTAINER(CC-REQUEST-CONTNR)
             CHANNEL(WS-CURRENTCHANNELNAME)
             INTO(WS-REQUEST-LAYOUT)
             RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT

      * INITIALIZE RESPONSE CONTAINER

           EXEC CICS PUT CONTAINER(CC-RESPONSE-CONTNR)
                CHANNEL(WS-CURRENTCHANNELNAME)
                FROM(WS-RESPONSE-INITIALIZE)
                RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT

      * MOVE REQUEST DATA TO CONTAINER ALONG WITH TRAN ID
           EXEC CICS PUT CONTAINER(CC-REQUEST-CONTNR)
             FROM(WS-API-REQUEST)
             CHANNEL(WS-CURRENTCHANNELNAME)
             RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT

           EXEC CICS
             LINK PROGRAM(CC-PEMCL)
             CHANNEL(WS-CURRENTCHANNELNAME)
             RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT

           PERFORM CA000-EXTRACT-CONTROLDATA
              THRU CA999-EXIT

           PERFORM YA000-ENDLINE
              THRU YA999-EXIT
              .
       BA999-EXIT.
             EXIT.
           EJECT

       CA000-EXTRACT-CONTROLDATA            SECTION.
      *****************************************************************
      * EXTRACT FAULT DATA FROM CELERITI CONTROL CONTAINER            *
      *****************************************************************
      *READ DATA FROM THE CELERITI CONTROL CONTAINER
           EXEC CICS GET CONTAINER(CC-CEL-CONTROL)
             INTO(WS-ERROR-DATA)
             RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT

           INITIALIZE WS-RESPONSE-LAYOUT

           EXEC CICS GET CONTAINER(CC-RESPONSE-CONTNR)
                CHANNEL(WS-CURRENTCHANNELNAME)
                INTO(WS-RESPONSE-LAYOUT)
                RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
           END-EXEC

           PERFORM WA000-CHECK-RESPONSE
              THRU WA999-EXIT

           IF WS-ERROR-MSG  NOT EQUAL SPACES AND LOW-VALUES
             INSPECT WS-ERROR-MSG   TALLYING WS-COUNT-1
                                         FOR ALL LOW-VALUES
             MOVE WS-ERROR-MSG(CH-1:LENGTH OF WS-ERROR-MSG - WS-COUNT-1)
                                            TO WS-ERROR
      *
             INITIALIZE WS-STATUSMESSAGE
             MOVE CC-E                      TO WS-SEVERITY
             MOVE WS-ERROR(CH-6:CH-42)      TO WS-STATUSMESSAGE

             EXEC CICS PUT CONTAINER(CC-RESPONSE-CONTNR)
                  CHANNEL(WS-CURRENTCHANNELNAME)
                  FROM(WS-RESPONSE-LAYOUT)
                  RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
             END-EXEC

             PERFORM WA000-CHECK-RESPONSE
                 THRU WA999-EXIT

             MOVE CC-Y                      TO WS-ROLLBACK-IND
             PERFORM YA000-ENDLINE
           END-IF
            .
       CA999-EXIT.
             EXIT.
           EJECT


       WA000-CHECK-RESPONSE                 SECTION.
      *****************************************************************
      *    CHECK THE RESPONSE AFTER EXECUTING CICS COMMANDS           *
      *****************************************************************

           IF  WS-COMMAND-RESP  = DFHRESP(NORMAL)
           AND WS-COMMAND-RESP2 = DFHRESP(NORMAL)
              NEXT SENTENCE
           ELSE
              INITIALIZE WS-STATUSMESSAGE
                         WS-RESPONSE-LAYOUT
              MOVE CC-Y                     TO WS-ROLLBACK-IND
              MOVE CC-E                     TO WS-SEVERITY
              MOVE CC-CICS-ERROR            TO WS-STATUSMESSAGE

              EXEC CICS PUT CONTAINER(CC-RESPONSE-CONTNR)
                  CHANNEL(WS-CURRENTCHANNELNAME)
                  FROM(WS-RESPONSE-LAYOUT)
                  RESP(WS-COMMAND-RESP) RESP2(WS-COMMAND-RESP2)
              END-EXEC

              PERFORM YA000-ENDLINE
           END-IF
           .

       WA999-EXIT.
             EXIT.
           EJECT

       YA000-ENDLINE                        SECTION.
      ***************************************************************
      *CHECK IF ROLLBACK INDICATOR IS SET TO TRUE IN THE CONTROL    *
      *CONTAINER DATA. IF TRUE THEN ISSUE A ROLLBACK.               *
      ***************************************************************

            IF  WS-ROLLBACK-IND EQUAL CC-Y
                EXEC CICS
                  SYNCPOINT ROLLBACK
                END-EXEC
            END-IF

      ***************************************************************
      *    RETURN COMMAND                                           *
      ***************************************************************
             EXEC CICS
                  RETURN
             END-EXEC
               .
       YA999-EXIT.
             EXIT.
           EJECT
      *END PROCEDURE DIVISION
       END PROGRAM A40212.
