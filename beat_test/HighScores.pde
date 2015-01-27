boolean alphaLock = false;
boolean nameEntered = false;
int alphaCount = 0;
String name = "";

void highScore()
{
  String[] data = loadStrings("HighScores.txt");

  for (int i = 0; i < data.length; i++)
  {

    String[] songData =  data[i].split(",");
    songs.get(i).player = songData[0];
    songs.get(i).highScore = int(songData[1]);
  }
}

void enterName()
{
  String[] alphabet = {
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
  };

  if (name.length() < 6 && !nameEntered)
  {
    if (checkKey(players.get(bestPlayer).right) && !alphaLock)
    {
      if (alphaCount == 35)
      {
        alphaCount = 0;
      }
      else
      {
        alphaCount++;
      }
      alphaLock = true;
    }
    if (checkKey(players.get(bestPlayer).left) && !alphaLock)
    {
      if (alphaCount == 0 )
      {
        alphaCount = 35;
      }
      else
      {
         alphaCount--; 
      }
      alphaLock = true;
    }
    if(checkKey(players.get(bestPlayer).button1) && !alphaLock)
    {
      name += alphabet[alphaCount];
      alphaLock = true;
    }
    if (checkKey(players.get(bestPlayer).start) && !alphaLock)
    {
      nameEntered = true;
    }
    if(checkKey(players.get(bestPlayer).button2) && !alphaLock)
    {
       if(name.length() > 0)
      {
         name = name.substring(0, name.length()-1);
      } 
      alphaLock = true;
    }
    if( !checkKey(players.get(bestPlayer).start) && !checkKey(players.get(bestPlayer).left) && !checkKey(players.get(bestPlayer).right) && !checkKey(players.get(bestPlayer).button1) && !checkKey(players.get(bestPlayer).button2))
    {
       alphaLock = false; 
    }
  }
  else if(nameEntered == true || name.length() >= 6)
  {
    songs.get(menuCount).player = name;
    songs.get(menuCount).highScore = players.get(bestPlayer).points;
    println("name recorded");
    updateHighscore(); 
  }
  
  textSize(20);
  fill(0);
  rect(width/20, height/20, width - (height/20 * 2), height - (height/20 * 2));
  fill(255);
  text("Player" + (bestPlayer + 1) + "name:", width/2, height/10);
  text(name,width/2, height/5);
  text(alphabet[alphaCount], width/2,height/2);
  textSize(15);
}

void updateHighscore()
{
    String[] scoreWriter = new String[songs.size()];
    
    for(int i = 0; i < songs.size(); i++)
    {
       scoreWriter[i] = songs.get(i).player + "," +  songs.get(i).highScore;  
    }
    
    saveStrings("HighScores.txt",scoreWriter);
    println(scoreWriter);
    
    if(checkKey(players.get(bestPlayer).start))
    {
      returnMainMenu();
    }
    
    
    
    
}

