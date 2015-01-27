
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float eRadius,kickSize, snareSize, hatSize;
boolean mainMenu = true;
boolean songSelection = false;
boolean howToPlay = false;
boolean highScoreScreen = false;


void setup()
{
   size(700,500,P3D); 
  frameRa 
   //perform setups
   
   PlatformInit();
   setUpPlayerControllers();
   
   minim = new Minim(this);
   songSetup();
   highScore();
   
  ellipseMode(RADIUS);
  eRadius =  20;
   
}

void draw()
{
   background(0);
   if(mainMenu)
   {
     Menu();
   }
   else if(songSelection)
   {
     songSelect();
   }
   else if(howToPlay)
   {
     instructions();
   }
   else if(highScoreScreen)
   {
      enterName();
   }
   else
   {
   
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
}

