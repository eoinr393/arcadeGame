void UI()
{
  for (int i = 0; i < players.size (); i ++)
  {
    float hX, hY;
    float hHeight = height / 5;

    hX = width/20;
    hY = height/20; 

    for (int j = 0; j < players.get (i).health; j++)
    {
      stroke(255, 0, 0);

      rect(hX + (i * (width/2 - hX)) + (j * 40), hY + ( j * ((height/5) /3)), width/20, height/5 - (j * ((height/5) /3) ));
      if (players.get(i).alive == false)
      {
        stroke(255, 0, 0);
        text("U R DED", hX + (i * (width/2 - hX)), hY + height/3);
      }
    }

    text("points:" + players.get(i).points + "\n  X" + players.get(i).bonus, hX + (i * (width/2 - hX)), hY + height/4);
    if (songEnd)
    {
      text("stage Complete", width/2, height/2);
    }
  }
}

void bonus()
{
  if (frameCount % 120 == 0)
  {
    for (int i = 0; i < players.size (); i ++)
    {
      if(players.get(i).bonus > 1 && players.get(i).alive == true)
      {
        players.get(i).bonus--;
      }
    }
  }
}

