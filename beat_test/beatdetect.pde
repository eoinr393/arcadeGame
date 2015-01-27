boolean songEnd = false;

class BeatListener implements AudioListener
{
   private BeatDetect beat;
   private AudioPlayer source;
 
 BeatListener(BeatDetect beat, AudioPlayer source)
 {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
 } 
 
 void samples(float[] samps)
 {
    beat.detect(source.mix); 
 }
 void samples(float[] sampsL, float[] sampsR)
 {
    beat.detect(source.mix); 
 }
}

void beatDetect()
{
   beat.detect(song.mix);
   float a = map(eRadius,20,80,60,255);
   fill(60,255,0,a);
   if(beat.isKick())
   {
      kickSize = 32;
      eRadius = height/10;
      blockInit();
   } 
   if(beat.isSnare())
   {
      snareSize = 32;
      eRadius = height/10;
      blockInit();

   } 
   if(beat.isHat())
   {
      hatSize = 32;
      eRadius = height/10;
      blockInit();
   } 
   
   kickSize = constrain(kickSize * 0.95, 16, 32);
   snareSize = constrain(snareSize * 0.95, 16, 32);
   hatSize = constrain(hatSize * 0.95, 16, 32);
   
   ellipse(width/2, height/2, eRadius, eRadius);
   
   eRadius *= 0.95;
   
   if( eRadius < height/35)
   {
      eRadius = height/35; 
   }
   
   songEnd = !song.isPlaying(); 
   if(songEnd)
   {
     stop();
   }  
}

void stop()
{
  song.close();
  
  minim.stop(); 
}
