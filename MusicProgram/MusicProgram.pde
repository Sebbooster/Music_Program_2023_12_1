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
void draw() {} //End draw
//
void keyPressed() {
  song1.loop(0);
  //if () .play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
} //End keyPressed
//
void mousePressed() {} //End mousePressed
//
//End MAIN Program
