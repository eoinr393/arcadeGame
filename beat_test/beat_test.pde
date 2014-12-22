
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
   beat.detect(song.mix);
   float a = map(eRadius,20,80,60,255);
   fill(60,255,0,a);
   if(beat.isKick())
   {
      kickSize = 32;
      eRadius = 80;
   } 
   if(beat.isOnset())
   {
      snareSize = 32;
      eRadius1 = 80;
   } 
   if(beat.isHat())
   {
      hatSize = 32;
      eRadius2 = 80;
   } 
   
   kickSize = constrain(kickSize * 0.95, 16, 32);
   snareSize = constrain(snareSize * 0.95, 16, 32);
   hatSize = constrain(hatSize * 0.95, 16, 32);
   
   ellipse(width/2, height/2, eRadius, eRadius);
   ellipse(50,50, eRadius1, eRadius1);
   ellipse(250,50, eRadius2,eRadius2);
   
   eRadius *= 0.95;
   eRadius1 *= 0.95;
   eRadius2 *= 0.95;
   
   if( eRadius < 20)
   {
      eRadius = 20; 
   }
   if( eRadius1 < 20)
   {
      eRadius1 = 20; 
   }
   if( eRadius2 < 20)
   {
      eRadius2 = 20; 
   }
}
