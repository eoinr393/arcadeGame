
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float eRadius, eRadius1, eRadius2, kickSize, snareSize, hatSize;


void setup()
{
   size(700,700,P3D);  
   //perform setups
   PlatformInit();
   setUpPlayerControllers();
   //load songs
   minim = new Minim(this);
   song = minim.loadFile("Crypt of the NecroDancer Alpha OST - Zone 3 Level 1 Cold(New).mp3");
   song.play();
  //a beat detection object that is  FREQ_ENERGY mode that
  // expects buggest the lingth of song's buffer size
  // and samples captured at songs sample rate
  beat = new BeatDetect(song.bufferSize(),song.sampleRate());
  
  //set the sensitivity to 300 milliseconds 
  //after a beat has been detected the algorithm will wait for 300 miliseconds
  //before allowing another beat to be reported. You can use this to dampen the 
  //algorithm if it is giving too many false-positives. The default calue is 10.
  beat.setSensitivity(300);
  kickSize = snareSize = hatSize = 16;
  //make a new beat listener so that it wont miss any buffers for the analysis
  bl = new BeatListener(beat,song);
  ellipseMode(RADIUS);
  eRadius = eRadius1 = eRadius2 = 20;
   
}

void draw()
{
   background(0);
   
   for(Platform platform:platforms)
   {
     platform.update();
     platform.display();
   }
    for(Player player:players)
   {
     player.update();
     player.display();
   }
   for(Block block:blocks)
   {
      block.update();
      block.display(); 
   }
   
   PlatformMove();
   bonus();
   
   beatDetect();
   
}
