class Player extends GameObject
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int side = 0;
  int row;
  int health = 3;
  int points = 0;
  int bonus = 1;
  float sizeX = 20;
  float toMove = (platforms[0].pWidth / 4);
  float theta = 0;
  float kneeMove = 7;
  color colour;
  boolean keyUp, keyDown, keyLeft, keyRight, butt;
  boolean alive = true;
  PVector knee = new PVector(sizeX/4, sizeX *2, 0);
  PVector foot = new PVector(sizeX/4, sizeX * 2 + sizeX/2, 0);


  Player()
  {
    pos = new PVector();
  }

  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }

  Player(int index, color colour, XML xml)
  {
    this(index
      , colour
      , buttonNameToKey(xml, "up")
      , buttonNameToKey(xml, "down")
      , buttonNameToKey(xml, "left")
      , buttonNameToKey(xml, "right")
      , buttonNameToKey(xml, "start")
      , buttonNameToKey(xml, "button1")
      , buttonNameToKey(xml, "button2")
      );
  }

  void update()
  { 
    if (alive)
    {
      int otherIndex;

      if (index == 0)
      {
        otherIndex = 1;
      } else
      {
        otherIndex = 0;
      }
      //if a player is on the side platforms and presses up
      if ((((checkKey(up)) && keyUp) && ((side == 1 && row != 0) || (side == 3 && row != 3))) && !checkKey(button1))
      {
        //if the player wont touch the other by moving once
        if ((players.get(index).side != players.get(otherIndex).side) ||(players.get(index).side == 1 && players.get(otherIndex).side == 1 &&(players.get(otherIndex).row != players.get(index).row -1)) || (players.get(index).side == 3 && players.get(otherIndex).side == 3 &&(players.get(otherIndex).row != players.get(index).row +1)))
        {
          pos.y -= toMove;
          keyUp = !keyUp;

          if (side == 1)
          {
            row--;
          } else
          {
            row++;
          }
        }
      }
      if (!checkKey(up))
      {
        keyUp = true;
      }

      if ((((checkKey(down)) && keyDown) && ((side == 1 && row != 3) || (side == 3 && row != 0))) && !checkKey(button1))
      { 
        if ((players.get(index).side != players.get(otherIndex).side) || (players.get(index).side == 1 && players.get(otherIndex).side == 1 &&(players.get(otherIndex).row != players.get(index).row +1)) || (players.get(index).side == 3 && players.get(otherIndex).side == 3 &&(players.get(otherIndex).row != players.get(index).row -1)))
        {
          pos.y += toMove;
          keyDown = !keyDown;
          if (side == 1)
          {
            row++;
          } else
          {
            row--;
          }
        }
      }
      if (!checkKey(down))
      {
        keyDown = true;
      }

      if ((((checkKey(left)) && keyLeft) && ((side == 0 && row != 0) || (side == 2 && row != 3))) && !checkKey(button1))
      { 
        if ((players.get(index).side != players.get(otherIndex).side) || (players.get(index).side == 0 && players.get(otherIndex).side == 0 && (players.get(otherIndex).row != players.get(index).row -1)) || (players.get(index).side == 2 && players.get(otherIndex).side == 2 &&(players.get(otherIndex).row != players.get(index).row +1)))
        {
          pos.x -= toMove;
          keyLeft = !keyLeft;
          if (side == 0)
          {
            row--;
          } else
          {
            row++;
          }
        }
      }
      if (!checkKey(left))
      {
        keyLeft = true;
      }

      if ((((checkKey(right)) && keyRight) && ((side == 0 && row != 3) || (side == 2 && row != 0))) && !checkKey(button1))
      {
        if ((players.get(index).side != players.get(otherIndex).side) || (players.get(index).side == 0 && players.get(otherIndex).side == 0 &&(players.get(otherIndex).row != players.get(index).row +1)) || (players.get(index).side == 2 && players.get(otherIndex).side == 2 &&(players.get(otherIndex).row != players.get(index).row -1)))
        {
          pos.x += toMove;
          keyRight = !keyRight;
          if (side == 0)
          {
            row++;
          } else
          {
            row--;
          }
        }
      }
      if (!checkKey(right))
      {
        keyRight = true;
      }
      if (checkKey(start))
      {
        println("Player " + index + " start");
      }
      if (checkKey(button1))
      {
        println("Player " + index + " button 1");
      }
      if (checkKey(button2))
      {
        println("Player " + index + " butt2");
      }
      //rotate left
      if (((checkKey(button1) && checkKey(left)) && platforms[1].pos.z + platforms[1].len / 2 >= pos.z) && keyLeft)
      {
        if (players.get(otherIndex).side != 1 || (players.get(otherIndex).side == 1 && players.get(otherIndex).row != players.get(index).row))
        {
          if (side == 0)
          {
            pos = playerRotate(PI/2, pos.x, pos.y);
          }
          if (side == 2)
          {
            pos = playerRotate(PI + PI/2, pos.x, pos.y);
          }
          if (side == 3)
          {
            pos = playerRotate(PI, pos.x, pos.y);
          }

          theta = PI/2;
          side = 1;

          if (bonus < 5 && alive == true)
          {
            bonus++;
          }
        }
        keyLeft = false;
      }
      //rotate up
      if (((checkKey(button1) && checkKey(up)) && platforms[2].pos.z + platforms[2].len / 2 >= pos.z) && keyUp)
      {
        if (players.get(otherIndex).side != 2 || (players.get(otherIndex).side == 2 && players.get(otherIndex).row != players.get(index).row))
        {
          if (side == 0)
          {
            pos = playerRotate(PI, pos.x, pos.y);
          }
          if (side == 1)
          {
            pos = playerRotate(PI/2, pos.x, pos.y);
          }
          if (side == 3)
          {
            pos = playerRotate(PI + PI/2, pos.x, pos.y);
          } 

          theta = PI;
          side = 2;  
          if (bonus < 5 && alive == true)
          {
            bonus++;
          }
        }

        keyUp = false;
      }
      //rotate right
      if (((checkKey(button1) && checkKey(right)) && platforms[3].pos.z + platforms[3].len / 2 >= pos.z) && keyRight)
      {
        if (players.get(otherIndex).side != 3 || (players.get(otherIndex).side == 3 && players.get(otherIndex).row != players.get(index).row))
        {
          if (side == 0)
          {
            pos = playerRotate(PI/2 + PI, pos.x, pos.y);
          }
          if (side == 2)
          {
            pos = playerRotate(PI/2, pos.x, pos.y);
          }
          if (side == 1)
          {
            pos = playerRotate(PI, pos.x, pos.y);
          } 

          theta = PI/2 + PI;
          side = 3;

          if (bonus < 5 && alive == true)
          {
            bonus++;
          }
        }

        keyRight = false;
      }
      //rotate down
      if (((checkKey(button1) && checkKey(down))&& platforms[0].pos.z + platforms[0].len / 2 >= pos.z) && keyDown)
      {
        if (players.get(otherIndex).side != 0 || (players.get(otherIndex).side == 0 && players.get(otherIndex).row != players.get(index).row))
        {
          if (side == 1)
          {
            pos = playerRotate(PI/2 + PI, pos.x, pos.y);
          }
          if (side == 2)
          {
            pos = playerRotate(PI, pos.x, pos.y);
          }
          if (side == 3)
          {
            pos = playerRotate(PI/2, pos.x, pos.y);
          }

          theta = 0;
          side = 0;

          if (bonus < 5 && alive == true)
          {
            bonus++;
          }
        }

        keyDown = false;
      }


      //points
      if (health > 0 && !songEnd)
      { 
        points += 10 * bonus;
      }
      if (health < 1)
      {
        alive = false;
        row = 5;
      }

      if (knee.z <= pos.z - sizeX/2 || knee.z >= pos.z + sizeX)
      {
        kneeMove *= -1;
      }

      knee.z += kneeMove;
      foot.z += kneeMove;



      //if you go off the platform
      playerPlatform();
    }

  }

  void display()
  { 
    if (alive)
    { 

      stroke(colour);
      fill(colour, 30); 
      pushMatrix();
      translate(pos.x, pos.y, 0); 
      rotate(theta);

      box(sizeX);
      line(0, sizeX/2, 0, 0, sizeX + sizeX/2, sizeX);
      //arms
      line(0, sizeX/2 + sizeX/3, 0, -sizeX/2, sizeX +  sizeX/3, sizeX/2 + sizeX/3);
      line(0, sizeX/2 + sizeX/3, 0, sizeX/2, sizeX + sizeX/3, sizeX/2 + sizeX/3);
      //thighs
      line(0, sizeX +sizeX/2, sizeX/2, -knee.x, knee.y, -knee.z);
      line(0, sizeX +sizeX/2, sizeX/2, knee.x, knee.y, knee.z);
      //calves
      line(-knee.x, knee.y, -knee.z, -foot.x, foot.y, -foot.z);
      line(knee.x, knee.y, knee.z, foot.x, foot.y, foot.z);

      popMatrix();
    }
    UI();
  }
}

PVector playerRotate(float rot, float tempX, float tempY)
{
  float s = sin(rot);//get the sin in
  float c = cos(rot);//get the cos

  //take the rotation point from the point to rotate so
  //its now rotating around the origin
  tempX -= width/2;
  tempY -= height/2;

  float X1 = tempX * c - tempY * s;//rotate the the right x position
  float Y1 = tempX * s + tempY * c;//rotate to the right y position

  //add back the point so the new x and y are at their 
  //new respective positions
  float x = X1 + width/2;
  float y = Y1 + height/2;

  PVector rotPos = new PVector(x, y, 0);

  return(rotPos);
}
//if player falls off the platform reduce health and return to bottom platform
void playerPlatform()
{
  for (int i = 0; i < players.size (); i++)
  {
    int tempSide = players.get(i).side;

    int otherIndex;
    //set variables for the two players
    if (i == 0)
    {
      otherIndex = 1;
    } else
    {
      otherIndex = 0;
    }
    //if off the platform
    if (0 <= platforms[tempSide].pos.z - (platforms[tempSide].len/2))
    {
      players.get(i).health--;
      println("off platform");
      if (players.get(i).side == 1)
      {
        //check if the player is on the boundries of the platform
        if ((players.get(0).row == players.get(1).row) && players.get(otherIndex).side == 0)
        {
          if (players.get(i).row == 0)
          {
            players.get(i).pos.y += players.get(i).toMove;
            players.get(i).row++;
          } else
          {
            players.get(i).pos.y -= players.get(i).toMove;
            players.get(i).row--;
          }
        }
        //rotate the player
        players.get(i).pos = playerRotate(PI/2 + PI, players.get(i).pos.x, players.get(i).pos.y);
        println("called side 1");
      }
      if (players.get(i).side == 2)
      {
        //check if players share the same row and the other player is on the bottom
        if ((players.get(0).row == players.get(1).row)&& players.get(otherIndex).side == 0)
        {
          //change the players row accordingly
          if (players.get(i).row == 0)
          {
            players.get(i).pos.x -= players.get(i).toMove;
            players.get(i).row++;
          } else
          {
            players.get(i).pos.x += players.get(i).toMove;
            players.get(i).row--;
          }
        }
        //rotate the player
        players.get(i).pos = playerRotate(PI, players.get(i).pos.x, players.get(i).pos.y);
      }
      if (players.get(i).side == 3)
      {
        //check if players share the same row and the other player is on the bottom
        if ((players.get(0).row == players.get(1).row)&& players.get(otherIndex).side == 0)
        {
          //change the players row accordingly
          if (players.get(i).row == 0)
          {
            players.get(i).pos.y -= players.get(i).toMove;
            players.get(i).row++;
          } else
          {
            players.get(i).pos.y += players.get(i).toMove;
            players.get(i).row--;
          }
        }
        //rotate the player
        players.get(i).pos = playerRotate(PI/2, players.get(i).pos.x, players.get(i).pos.y);
      }
      players.get(i).theta = 0;
      players.get(i).side = 0;
    }
  }
}

void replay()
{
  float gap = (platforms[0].pWidth / 4) + (platforms[0].pWidth/4 - players.get(0).sizeX) + players.get(0).sizeX;
  
  for (int i = 0; i < 2; i ++)
  {
    players.get(i).points = 0;
    players.get(i).health = 3;
    players.get(i).bonus = 1;
    
    players.get(i).pos.x = xRows[0 + (i*3)]; //((platforms[0].pos.x - (platforms[0].pWidth / 2)) + (2 * platforms[0].pWidth/4) + (platforms[0].pWidth/4)/2) + (i * gap);
    players.get(i).pos.y = height - 85;
    players.get(i).row = 0 + (i*3);//int(((players.get(i).pos.x - (platforms[0].pos.x - platforms[0].pWidth/2)) / (platforms[0].pWidth / 4)));
    players.get(i).side = 0;
    players.get(i).alive = true;
    players.get(i).theta = 0;
  }
  gameOver = false;
  deathCount = 0;
  song.rewind();

}

void returnMainMenu()
{
  for (int i = 0; i < 2; i ++)
  {
    players.get(i).points = 0;
    players.get(i).health = 3;
    players.get(i).bonus = 1;
    
    players.get(i).pos.x = xRows[0 + (i*3)]; //((platforms[0].pos.x - (platforms[0].pWidth / 2)) + (2 * platforms[0].pWidth/4) + (platforms[0].pWidth/4)/2) + (i * gap);
    players.get(i).pos.y = height - 85;
    players.get(i).row = 0 + (i*3);//int(((players.get(i).pos.x - (platforms[0].pos.x - platforms[0].pWidth/2)) / (platforms[0].pWidth / 4)));
    players.get(i).side = 0;
    players.get(i).alive = true;
    players.get(i).theta = 0;
  }
  gameOver = false;
  mainMenu = true;
  songSelection = false;
  howToPlay = false;
  songEnd = false;
  menuCount = 0;
  deathCount = 0;
  highScoreScreen = false;
  alphaLock = false;
  nameEntered = false;
  alphaCount = 0;
  name = "";
  song.pause();
  song.cue(0);
  textSize(15);
}

