void SongProperties(){
   println("File Name", songMetaData[currentSong].fileName() ); //Data Correct, Verified in Console
  //Must use pure Java at OS Level to list fileName before loading Playlist
  println("Song Length (in milliseconds)", songMetaData[currentSong].length() );
  println("Song Length (in seconds)", songMetaData[currentSong].length()/1000 ); 
  println("Song Length (in minutes & seconds)", songMetaData[currentSong].length()/1000/60, "minutes", ( songMetaData[currentSong].length()/1000 - ( songMetaData[currentSong].length()/1000/60)*60 ), "seconds" ); //Gets Formula
  println("Song Title", songMetaData[currentSong].title() );
  println("Author", songMetaData[currentSong].author() );
  println("Composer", songMetaData[currentSong].composer() );
  println("Orchestra", songMetaData[currentSong].orchestra() );
  println("Album", songMetaData[currentSong].album() );
  println("Disk", songMetaData[currentSong].disc() );
  println("Publisher", songMetaData[currentSong].publisher() );
  println("Date Released", songMetaData[currentSong].date() );
  println("Copyright", songMetaData[currentSong].copyright() );
  println("Comments", songMetaData[currentSong].comment() );
  println("Lyrics", songMetaData[currentSong].lyrics() ); //OPTIONAL: Music App Sing Along
  println("Track", songMetaData[currentSong].track() );
  println("Genre", songMetaData[currentSong].genre() );
  println("Encoded", songMetaData[currentSong].encoded() );
}//end songprop
