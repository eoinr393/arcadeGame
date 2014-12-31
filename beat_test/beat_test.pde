
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float eRadius, eRadius1, eRadius2, kickSize, snareSize, hatSize;

void setup()
{
   size(500,500,P3D);  
   //set up the player controller
   setUpPlayerControllers();
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
  //algorithm if it is giving too many false-positives. The default calue is 10
  //which is essentially no damping, If you try and set the sensitivity to a negatice value
  //an error will appear adn it will be set to 10 instead
  beat.setSensitivity(200);
  kickSize = snareSize = hatSize = 16;
  //make a new beat listener so that we wont miss any buffers for the analysis
  bl = new BeatListener(beat,song);
  ellipseMode(RADIUS);
  eRadius = eRadius1 = eRadius2 = 20;
   
}

void draw()
{
   background(0);
   
   for(Player player:players)
   {
     player.update();
     player.display();
   }
   
   beatDetect();
}