
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float eRadius, kickSize, snareSize, hatSize;
boolean mainMenu = true;
boolean songSelection = false;
boolean howToPlay = false;
boolean highScoreScreen = false;

PImage[] howTo = new PImage[3];
PImage beatBlox;

void setup()
{
  size(1000,700 , P3D);  
  //perform setups

  PlatformInit();
  setUpPlayerControllers();

  minim = new Minim(this);
  songSetup();
  highScore();
  
  howTo[0] = loadImage("howTo1.png");
  howTo[1] = loadImage("howTo2.png");
  howTo[2] = loadImage("howTo3.png");
  
  beatBlox = loadImage("BeatBlox.png");

  ellipseMode(RADIUS);
  eRadius =  20;
}

void draw()
{
  background(0);
  if (mainMenu)
  {
    image(beatBlox, width/4, height/10, width/2,height/2);
    Menu();
  } 
  else if (songSelection)
  {
    songSelect();
  } 
  else if (howToPlay)
  {
    instructions();
  } 
  else if (highScoreScreen)
  {
    enterName();
  } 
  else
  {

    for (Platform platform : platforms)
    {
      platform.update(); 
      platform.display();
    }
    for (Player player : players)
    {
      player.update(); 
      player.display();
    }
    for (Block block : blocks)
    {
      block.update(); 
      block.display();
    }

    PlatformMove(); 
    bonus(); 

    beatDetect();
  }
}

