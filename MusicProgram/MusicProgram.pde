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
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
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
  println(path);
  
  song1 = minim.loadFile( path );
  song1.loop(0);
} //End setup
//
void draw() {
//note: logical operators could be nested IFs
if ( song1.isLooping() && song1.loopCount()!=-1) println("there are", song1.loopCount(), "loops left");
if ( song1.isLooping() && song1.loopCount()==-1) println("looping infinitely");
if ( song1.isLooping() && song1.isPlaying() ) println("Play Once");
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song1.play();
  //
  if(key=='1' || key=='9'){
    String keystr = String.valueOf(key);
    println("keystring");
      int loopNum = int(keystr);
    song1.loop(loopNum);
    if(key=='M' || key=='m') { //mute function, stops sound not file
      if (song1.isMuted();) {
      song1.unmute();
      } else {
      song1.mute();
      }
      //
      if(key=='R' || key=='r') song1.skip(1000);
      //
      if(key=='F' || key=='f') song1.skip(0);
  }
  //if () .play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  if (key=='S' || if key=='s') {
    if(song1.isPlaying() ) {
      song1.pause();
    } else {
      song1.rewind();
    }
  }
} //End keyPressed
//
void mousePressed() {} //End mousePressed
//
//End MAIN Program
