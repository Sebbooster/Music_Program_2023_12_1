//global variables
float SongImageX, SongImageY, SongImageW, SongImageH;
float BackgroundX, BackgroundY, BackgroundW, BackgroundH;
//

void SongImages(){
   String pathLand = "ImagesUsed/Landscape and Square/" ;
  String pathPort = "ImagesUsed/Portrait/" ;
    String Inso="INSOMNIA Logo.png";
    String Explode = "Nuclear-Explosion.jpg";
    String BG = "MusicBG.jpg";
  String Insomnia1 = sketchPath ( pathPort + Inso);
  String Explosion1 = sketchPath (pathLand + Explode);
  String BGImage1 = sketchPath ( pathLand + BG);
  BGImage = loadImage (BGImage1);
  Insom = loadImage (Insomnia1);
  Explosion = loadImage (Explosion1);
//population
SongImageX = appWidth*3/8;
SongImageY = appHeight*2/6;
SongImageW = appWidth*1/4;
SongImageH = appHeight*3/8;
BackgroundX = appWidth;
BackgroundY = appHeight;
BackgroundW = appWidth;
BackgroundH = appHeight;
//
if (song[0].isPlaying()) {
image(Insom, SongImageX, SongImageY, SongImageW, SongImageH);
noTint();
image(BGImage, BackgroundX, BackgroundY, BackgroundW, BackgroundH);
 } else if (song[1].isPlaying()) {
image(Explosion, SongImageX, SongImageY, SongImageW, SongImageH);
noTint();
image(BGImage, BackgroundX, BackgroundY, BackgroundW, BackgroundH);
 }
} //end SongImages
