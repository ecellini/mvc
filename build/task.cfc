/**
* clone project to Lucee run folder :)
*/
component {

  public String function loadDest( string dest ){
    if( !structKeyExists( arguments, "dest" ) ){
      arguments.dest = getCWD() & "build-mvc/";
    }

    return arguments.dest;
  }

   function startWatcher( string dest ) {
    var src = getCWD();
    var dest = loadDest( argumentCollection=arguments );

    print.greenLine( "watch #src#" ).toConsole();

    watch()
    .paths( '**.cf*','**.json','**.js' )
    .inDirectory( src )
    .withDelay( 1000 )
    .onChange( function( paths ) {
      print.line( 'Something changed!' ).toConsole();
      // print.line( '#paths.added.len()# paths were added!' )
      // .line( '#paths.removed.len()# paths were removed!' )
      // .line( '#paths.changed.len()# paths were changed!' ).toConsole();

      paths.changed.each( function(item){
        fileCopy( fileSystemUtil.resolvePath(item), dest & item );
        print.line( 'path>> #item# were changed >> #dest##item#' ).toConsole();
      });
             
    })
    .start();
   }
   
   function clean_deploy( string dest ) {
    var src = getCWD();
    var dest = loadDest( argumentCollection=arguments );

    print.greenLine( "clean-deploy to #dest#" ).toConsole();

    if( directoryExists(dest) ){
      directoryDelete(dest,true);
    }

    directoryCreate( dest );
    directoryCopy( src, dest, true );
    //directoryDelete( dest & ".git" );
    //directoryDelete( dest & ".vscode" );

    command( 'server cd mvc-test' )
      .run();

    command( 'install' )
      .run();

   }

  }