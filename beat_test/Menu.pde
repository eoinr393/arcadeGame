
int menuCount = 0;
boolean menuUp, menuDown, menuButt1, menuButt2;

void Menu()
{
  if (checkKey(players.get(0).down) && menuCount != 2 && menuDown)
  {
    menuCount++;
    menuDown = false;
  }
  if (!checkKey(players.get(0).down))
  {
    menuDown = true ;
  }
  if (checkKey(players.get(0).up) && menuCount != 0 && menuUp)
  {
    menuCount--;
    menuUp = false;
  }
  if (!checkKey(players.get(0).up))
  {
    menuUp = true;
  }
  if (menuCount == 0 && checkKey(players.get(0).button1) && menuButt1)
  {
    menuButt1 = false;
    menuCount = 0;
    songSelection = true;
    mainMenu = false;
  }
  if (menuCount == 1 && checkKey(players.get(0).button1) && menuButt1)
  {
    menuButt1 = false;
    instructions();
  }
  if (menuCount == 2 && checkKey(players.get(0).button1) && menuButt1)
  {
    menuButt1 = false;
    exitGame();
  }
  if (!checkKey(players.get(0).button1))
  {
    menuButt1 = true ;
  }

  textAlign(CENTER);
  textSize(15);
  if (menuCount == 0) textSize(30);
  text("Play", width/2, height/2);
  textSize(15);
  if (menuCount == 1) textSize(30);
  text("How To Play", width/2, height/2 + height/20);
  textSize(15);
  if (menuCount == 2) textSize(30);
  text("Exit", width/2, height/2 + (height/20 * 2));
  textSize(15);

  text(menuCount, 50, 50);
}

void songSelect()
{
  for (int i = 0; i < songs.size(); i++)
  {
    textSize(15);
    if (menuCount == i) textSize(30);
    text(songNames.get(i), width/2, height/2 + (i * height/20));
  } 

  if (checkKey(players.get(0).down) && menuCount != songs.size() - 1 && menuDown)
  {
    menuCount++;
    menuDown = false;
  }
  if (!checkKey(players.get(0).down))
  {
    menuDown = true ;
  }
  if (checkKey(players.get(0).up) && menuCount != 0 && menuUp)
  {
    menuCount--;
    menuUp = false;
  }
  if (!checkKey(players.get(0).up))
  {
    menuUp = true;
  }
  if (checkKey(players.get(0).button1) && menuButt1)
  {
    song = songs.get(menuCount);
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    //set the sensitivity to 300 milliseconds 
    //after a beat has been detected the algorithm will wait for 300 miliseconds
    //before allowing another beat to be reported. You can use this to dampen the 
    //algorithm if it is giving too many false-positives. The default calue is 10.
    beat.setSensitivity(300);
    kickSize = snareSize = hatSize = 16;

    //make a new beat listener so that it wont miss any buffers for the analysis
    bl = new BeatListener(beat, song);

    songSelection = false;
    song.play();
  }
  if (!checkKey(players.get(0).button1))
  {
    menuButt1 = true;
  }
  if(checkKey(players.get(0).button2) && menuButt2)
  {
     menuButt2 = false;
     songSelection = false;
     mainMenu = true;
     menuCount = 0; 
  }
  if(!checkKey(players.get(0).button2))
  {
     menuButt2 = true; 
  }
  
}

void instructions()
{
}

void exitGame()
{
  minim.stop();
  exit();
}

