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
