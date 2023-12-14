//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
int numberOfSongs = 8;
int numberSoundEffects = 8;
AudioPlayer[] song = new AudioPlayer [numberOfSongs]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer[] soundEffect= new AudioPlayer [numberSoundEffects];
AudioMetaData[] songMetaData = new AudioMetaData [numberOfSongs];
PFont font;
color ink=#000000;
//
void setup() {
  //size() or fullScreen()
  //Display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String Boom = "VineBoom.mp3";
  String extension = ".mp3";
  String pathway = "MusicUsed/DownloadedMusic/"; //Relative Path
  String path = sketchPath( pathway + Boom ); //Absolute Path
  // See: https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
  //println(path);
  
  song[0] = minim.loadFile( path );
  songMetaData[0] = song[0].getMetaData();
  font = createFont("Ink Free", 55);
} //End setup
//
void draw() {
//note: logical operators could be nested IFs
if ( song[0].isLooping() && song[0].loopCount()!=-1) println("there are", song[0].loopCount(), "loops left");
if ( song[0].isLooping() && song[0].loopCount()==-1) println("looping infinitely");
if ( song[0].isLooping() && song[0].isPlaying() ) println("Play Once");

println("File Name", songMetaData[0].fileName() );
//
println("Song Length (miliseconds)", songMetaData[0].length() );
println("Song Length (seconds)", songMetaData[0].length()/1000 );
println("Song Length (minutes and seconds)", songMetaData[0].length()/1000/60, "minutes", songMetaData[0].length()/1000 - ( (songMetaData[0].length()/1000/60)*60 ), "seconds" );
println("Title", songMetaData[0].title() );
println("Author", songMetaData[0].author() );
println("Composer", songMetaData[0].composer() );
println("Orchestra", songMetaData[0].orchestra() );
println("Album", songMetaData[0].album() );
println("Disk", songMetaData[0].disc() );
println("Publisher", songMetaData[0].publisher() );
println("Date Released", songMetaData[0].date() );
println("Copyright", songMetaData[0].copyright() );
println("Comments", songMetaData[0].comment() );
println("Lyrics", songMetaData[0].lyrics() );
println("Track", songMetaData[0].track() );
println("Genre", songMetaData[0].genre() );
println("Encoded", songMetaData[0].encoded() );
//
//songMetaData1.title()
//

rect(width*1/4, height*0, width*1/2, height*3/10);
fill(ink);
textAlign(CENTER, CENTER);
int size = 10;
textFont(font, size);
text(songMetaData[0].title(), width*1/4, height*0, width*1/2, height*3/10);
fill(255);
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song[0].play();
  //
  if(key=='1' || key=='9'){
    String keystr = String.valueOf(key);
    println("keystring");
      int loopNum = int(keystr);
    song[0].loop(loopNum);
    if(key=='M' || key=='m') { //mute function, stops sound not file
      if (song[0].isMuted()) {
      song[0].unmute();
      } 
    } else {
      song[0].mute();
      }
      //
      if(key=='R' || key=='r') song[0].skip(1000);
      //
      if(key=='F' || key=='f') song[0].skip(0);
  }
  //if () .play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  if (key=='S' || key=='s') {
    if(song[0].isPlaying() ) {
      song[0].pause();
    } 
  } else {
      song[0].rewind();
    }
} //End keyPressed
//
void mousePressed() {

} //End mousePressed
//
//End MAIN Program
