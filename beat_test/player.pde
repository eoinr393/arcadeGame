class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  int side = 0;
  int row;
  int health = 3;
  int points = 0;
  int bonus = 1;
  float sizeX = 20;
  float toMove = (platforms[0].pWidth / 4);
  color colour;
  boolean keyUp, keyDown, keyLeft, keyRight, butt;
  boolean alive = true;

  Player()
  {
    pos = new PVector(width / 2, height / 2);
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
    if ((((checkKey(up)) && keyUp) && ((side == 1 && row != 0) || (side == 3 && row != 3))) && !checkKey(button1)) && 
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
    if (!checkKey(up))
    {
      keyUp = true;
    }

    if ((((checkKey(down)) && keyDown) && ((side == 1 && row != 3) || (side == 3 && row != 0))) && !checkKey(button1))
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
    if (!checkKey(down))
    {
      keyDown = true;
    }

    if ((((checkKey(left)) && keyLeft) && ((side == 0 && row != 0) || (side == 2 && row != 3))) && !checkKey(button1))
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
    if (!checkKey(left))
    {
      keyLeft = true;
    }

    if ((((checkKey(right)) && keyRight) && ((side == 0 && row != 3) || (side == 2 && row != 0))) && !checkKey(button1))
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

    if (((checkKey(button1) && checkKey(left)) && platforms[1].pos.z + platforms[1].len / 2 >= pos.z) && keyLeft)
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

      side = 1;

      if (bonus < 5)
      {
        bonus++;
      }
      keyLeft = false;
    }
    if (((checkKey(button1) && checkKey(up)) && platforms[2].pos.z + platforms[2].len / 2 >= pos.z) && keyUp)
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

      side = 2;  
      if (bonus < 5)
      {
        bonus++;
      }

      keyUp = false;
    }
    if (((checkKey(button1) && checkKey(right)) && platforms[3].pos.z + platforms[3].len / 2 >= pos.z) &&  keyRight)
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

      side = 3;

      if (bonus < 5)
      {
        bonus++;
      }

      keyRight = false;
    }
    if (((checkKey(button1) && checkKey(down))&& platforms[0].pos.z + platforms[0].len / 2 >= pos.z) && keyDown)
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

      side = 0;

      if (bonus < 5)
      {
        bonus++;
      }

      keyDown = false;
    }


    //points
    if (health > 0 && !songEnd)
    { 
      points += moveSpeed * bonus;
    }

    //if you go off the platform
    playerPlatform();
  }

  void display()
  { 
    if (alive)
    { 
      stroke(colour);
      noFill(); 
      pushMatrix();
      translate(pos.x, pos.y, 0);   
      box(20);
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

void playerPlatform()
{
  for (int i = 0; i < players.size (); i++)
  {
    int tempSide = players.get(i).side;

    if (0 <= platforms[tempSide].pos.z - (platforms[tempSide].len/2))
    {
      players.get(i).health--;
      println("off platform");
      if (players.get(i).side == 1)
      {
        players.get(i).pos = playerRotate(PI/2 + PI, players.get(i).pos.x, players.get(i).pos.y);
        println("called side 1");
      }
      if (players.get(i).side == 2)
      {
        players.get(i).pos = playerRotate(PI, players.get(i).pos.x, players.get(i).pos.y);
      }
      if (players.get(i).side == 3)
      {
        players.get(i).pos = playerRotate(PI/2, players.get(i).pos.x, players.get(i).pos.y);
      }

      players.get(i).side = 0;
    }
  }
}

void playerCollide()
{
  for ( int i = 0; i < player.size (); i ++)
  {
    if (players.get(i).pos.x
  }
}

