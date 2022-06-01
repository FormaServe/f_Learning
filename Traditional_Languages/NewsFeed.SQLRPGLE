**Free
//*************************************************//
// Program:       FS004r1                          //
// Date:          October 2018                     //
// Description:   Get News Feeds                   //
//                                                 //
// FormaServe Systems Ltd                          //
// © Copyright - 1990 FormaServe Systems Ltd       //
//                                                 //
//*************************************************//

Ctl-Opt
 Option(*NoDebugIO:*SrcStmt:*NoUnref)
 AlwNull( *UsrCtl )
 Copyright('� FormaServe Systems 1990 | V1.0.0 2018/10 | Get News Feeds')
   ;

dcl-f NewsFeed workstn ;

//  Named Constants
Dcl-C VERSION 'Version 1.0.0 2018/02'  ;
Dcl-C TRUE '1'   ;
Dcl-C FALSE '0'   ;
Dcl-C ABD 1   ;
Dcl-C QUOTE ''''  ;
Dcl-C DQUOTE '"'  ;
Dcl-C OK 0 ;
Dcl-C EOF 100   ;
Dcl-C FSS 'FormaServe Systems Ltd'   ;
Dcl-C NOAPIERROR 0   ;
Dcl-C COPYRIGHT '© 1990 - FormaServe Systems Ltd.'  ;
Dcl-C FSSDAT d'1990-02-17' ;
Dcl-C URL 'www.formaserve.co.uk' ;
Dcl-c NORMAL x'20';
Dcl-c REVERSE x'21';
Dcl-c HIGHLITE x'22' ;

//  Standalone Definitions
Dcl-S Count Int ( 10 ) ;

Dcl-S IndArray Int ( 5 ) Dim( 99 );
Dcl-S Name Char ( 41 ) ;
Dcl-S RecCount Int ( 10 ) ;
Dcl-S MsgTxt Char ( 52 )  ;
Dcl-S PostCode  Char( 8 ) ;
Dcl-S Message   Char( 256 ) ;

  Exec Sql
    Set Option DatFmt = *Iso,
               Commit = *None,
               CloSqlCsr = *EndMod ;
// Main Loop
DoU 0 = ABD ;

  GetNews() ;

  Exfmt Sc01 ;

  If *In03 ;
    Leave ;
  EndIf;

enddo ;

Return ;

//****************************************************************//
//                                                                //
//  Get News Feed - GetNews()                                     //
//                                                                //
//****************************************************************//

Dcl-Proc GetNews ;

  // Local vars
  Dcl-S Count Int( 3 ) ;
  Dcl-S Error Ind Inz( '0' ) ;
  Dcl-S SQLStatement VarChar( 1024 );
  Dcl-S news VarChar( 1024 );

Dcl-Ds dsString Qualified;
  title VarChar(128);
  description VarChar(1024);
  link VarChar(255);
End-Ds ;

  // Select records
  SqlStatement =
  'SELECT * FROM XMLTABLE('
    + quote
    + '$result/rss/channel/item'
    + quote
    + ' PASSING XMLPARSE(DOCUMENT SYSTOOLS.HTTPGETBLOB('
    + quote
    + 'http://feeds.bbci.co.uk/news/england/rss.xml'
    + quote
    +  ' , '
    + quote
    + quote
    + ')) AS '
    + dquote
    + 'result'
    + dquote
    + ' COLUMNS title VARCHAR(128) PATH '
    + quote
    +  'title'
    + quote
    + ', description VARCHAR(1024) PATH '
    + quote
    + 'description'
    + quote
    + ', LINK VARCHAR(255) PATH '
    + quote
    + 'link'
    + quote
    + ') AS RESULT FETCH FIRST 10 ROWS ONLY'  ;

  // Prepare Selection
  Exec Sql
    Prepare s_Feed From :SqlStatement ;

  If SqlCod = OK ;

    // Declare Cursor for feed
    Exec Sql
      Declare c_Feed Cursor For s_Feed ;

    If SqlCod = OK ;

      // Open Cursor
      Exec Sql
        Open c_Feed ;

      DoU SqlCod <> OK ;

        Exec Sql
          Fetch c_Feed Into :dsString ;

        If SqlCod <> EOF ;  // All okay

          Count +=1 ;

          news = HIGHLITE + dsString.title + NORMAL + dsString.description ;

          select ;

            when count = 1 ;
              s1new1 = news ;
              s1lin1 = dsString.link ;

            when count = 2 ;
              s1new2 = news ;
              s1lin2 = dsString.link ;

            when count = 3 ;
              s1new3 = news ;
              s1lin3 = dsString.link ;

            when count = 4 ;
              s1new4 = news ;
              s1lin4 = dsString.link ;

            when count = 5 ;
              s1new5 = news ;
              s1lin5 = dsString.link ;

            when count = 6 ;
              s1new6 = news ;
              s1lin6 = dsString.link ;

            when count = 7 ;
              s1new7 = news ;
              s1lin7 = dsString.link ;

            when count = 8 ;
              s1new8 = news ;
              s1lin8 = dsString.link ;

            when count = 9 ;
              s1new9 = news ;
              s1lin9 = dsString.link ;

            when count = 10 ;
              s1new10 = news ;
              s1lin10 = dsString.link ;

          EndSl;

        EndIf ;

      EndDo ;

    EndIf;

  EndIf;

  // Close Cursor
  Exec Sql
    Close c_Feed ;

  Return ;

End-Proc ;
