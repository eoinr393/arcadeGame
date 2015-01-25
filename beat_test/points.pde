void UI()
{
  boolean gameOver = false;
  //print the health and score of both players
  for (int i = 0; i < players.size (); i ++)
  {
    float hX, hY;
    float hHeight = height / 5;
    float sizeX = width/10;
    float sizeY = height/20;
    int deathCount = 0;

    hX = width/20;
    hY = height/20; 

    float hGap = width -  (3*(sizeX + sizeX/10) + hX);

    for (int j = 0; j < players.get (i).health; j++)
    {

      stroke(255, 0, 0);
      fill(255, 0, 0, 50);
      rect(hX + (i * (hGap)) + (j * (sizeX + sizeX/10)), hY, sizeX, sizeY);
    }

    fill(255, 0, 25);
    if (players.get(i).alive == false)
    {
      text("U R DED", hX + (i * hGap), hY + sizeY * 3);
      deathCount += i + 1;
    }

    fill(0,255,0);
    text("score:" + players.get(i).points + "\n  X" + players.get(i).bonus, hX + (i * hGap), hY + sizeX * 2);
    
    if (songEnd && !gameOver)
    {
      text("stage Complete", width/2, height/2);
    }
    
    if(deathCount == players.size())
    {
       textSize(15);
       text("Game Over", width/2 - (6*15)/2, height/2); 
       gameOver = true;
       textSize(12);
    }
    
  }

  noFill();
}

void bonus()
{
  if (frameCount % 120 == 0)
  {
    for (int i = 0; i < players.size (); i ++)
    {
      if (players.get(i).bonus > 1 && players.get(i).alive == true)
      {
        players.get(i).bonus--;
      }
    }
  }
}

