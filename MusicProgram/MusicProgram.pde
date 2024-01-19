//test
//
//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
PImage Explosion, Insom, BGImage;
File musicFolder;
File effectFolder;
Minim minim; 
int appWidth, appHeight;
int numberOfSongs = 2, currentSong=0;
int numberSoundEffects = 2;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //song is now similar to song1
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //same as above
AudioMetaData[] soundEffectMetaData = new AudioMetaData [numberSoundEffects];
AudioPlayer[] soundEffect = new AudioPlayer[ numberSoundEffects ];
PFont font;
color ink=#000000;
Boolean changeState=false, stopBoolean=false, pauseBoolean=false, startB=false, pause=false, FB=false, PB=false;

//
void setup() {
  appWidth = displayWidth;
  appHeight = displayHeight;
  fullScreen();
  //size() or fullScreen()
  //Display Algorithm
  minim = new Minim(this);//creates object to access all functions
  //
  String pathway = "MusicUsed/DownloadedMusic/";
  String extension = ".mp3";
  String pathsong = sketchPath (pathway);
  musicFolder = new File(pathsong);
  int musicFileCount = musicFolder.list().length;
  File[] musicFiles = musicFolder.listFiles(); //String of Full Directies
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
    songFilePathway[i] = ( musicFiles[i].toString() );
  }
    numberOfSongs = musicFileCount; //Placeholder Only, reexecute lines after fileCount Known
  song = new AudioPlayer[numberOfSongs]; //song is now similar to song1
  printArray(song);
  songMetaData = new AudioMetaData[numberOfSongs]; //same as above
  for ( int i=0; i<musicFileCount; i++ ) {
    printArray(song);
    song[i]= minim.loadFile( songFilePathway[i] );
    songMetaData[i] = song[i].getMetaData();
  }
  // See: https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
  //println(path);
  /*
  song[currentSong] = minim.loadFile( path );
  songMetaData[currentSong] = song[currentSong].getMetaData();\
  */
  font = createFont("Ink Free", 55);
} //End setup
//
void draw() {
//note: logical operators could be nested IFs
if ( song[currentSong].isLooping() && song[currentSong].loopCount()!=-1) println("there are", song[currentSong].loopCount(), "loops left");
if ( song[currentSong].isLooping() && song[currentSong].loopCount()==-1) println("looping infinitely");
if ( song[currentSong].isLooping() && song[currentSong].isPlaying() ) println("Play Once");
//
//
//songMetaData1.title()
//
noFill();
noStroke();
rect(appWidth*1/4, appHeight*5/8, appWidth*1/2, appHeight*3/10);
fill(ink);
textAlign(CENTER, CENTER);
int size = 55;
textFont(font, size);
text(songMetaData[currentSong].title(), appWidth*1/4, appHeight*5/8, appWidth*1/2, appHeight*3/10);
fill(255);
if ( song[currentSong].isPlaying()==true ) {
    if ( stopBoolean==true || pauseBoolean==true ) {
      song[currentSong].pause();
    }
   if ( stopBoolean==true ) song[currentSong].rewind();
  } else {
    if ( changeState==false ) {
      song[currentSong].rewind();
      if (currentSong==numberOfSongs-1) {
        currentSong=0;
      } else {
        currentSong = currentSong + 1; //currentSong--; currentSong-=1}
      }
      song[currentSong].play();
    }
      song[currentSong].play();
    if ( stopBoolean==false && pauseBoolean==false && changeState==true ) {
      song[currentSong].play();
      changeState=false;
      //println("hereD5", song[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    }
    if ( pauseBoolean==false && stopBoolean==false  && changeState==true) {
      song[currentSong].play();
      changeState=false;
    } else {
      if ( changeState==true ) {
        if (pauseBoolean==true && stopBoolean==false ) {
        if (song[currentSong].isPlaying()) {
          song[currentSong].pause();
        }
        }
       }
      }
     }
     //
     //
      SongImages();
     SongProperties();
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song[currentSong].play();
  //
  if ( key=='M' || key=='m' ) {
    changeState=true;
    if ( pauseBoolean==false ) {
      pauseBoolean=true;
      println("herek2", pauseBoolean);
    } else {
      pauseBoolean=false;
      println("herek3", pauseBoolean);
      //playList[currentSong].play();
    }
    if (  stopBoolean==true ) {
      stopBoolean=false;
    }
    println ( "herek4", song[currentSong].isPlaying(), pauseBoolean, stopBoolean, changeState );
  }
  //
  /*
  if(key=='1' || key=='9'){
    String keystr = String.valueOf(key);
    println("keystring");
      int loopNum = int(keystr);
    song[currentSong].loop(loopNum);
    if(key=='M' || key=='m') { //mute function, stops sound not file
      if (song[currentSong].isMuted()) {
      song[currentSong].unmute();
      } 
    } else {
      song[currentSong].mute();
      }
      //
      if(key=='R' || key=='r') song[currentSong].skip(1000);
      //
      if(key=='F' || key=='f') song[currentSong].skip(0);
  }
  //if () .play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  if (key=='S' || key=='s') {
    if(song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } 
  } else {
      song[currentSong].rewind();
    }
    */
} //End keyPressed
//
void mousePressed() {

} //End mousePressed
//
//End MAIN Program
