Platform platforms[] = new Platform[4];
float moveSpeed = 0.5;
int platNum = 0;
boolean restartButt1 = false;

class Platform extends GameObject
{
  float len;
  float pWidth = width/3.5;
  float pHeight = height/35;
  boolean displayed = false;

  Platform()
  {
    pos = new PVector(height/2, width/2, -100);
  }    

  Platform(int index)
  {
    this();
    this.index = index;
  }

  //update function
  void update()
  {
    if (moveSpeed < 20)
    {
      moveSpeed += 0.01;
    }
    if (index != 0)
    {
      pos.z += moveSpeed;
    }

    //see if its displayed or not
    if (pos.z - len > -(len/2))
    {
      displayed = false;  
      platNum--;
    }
    if(!checkKey(players.get(0).button1) && !checkKey(players.get(1).button2))
    {
         restartButt1 = false; 
    }

    if (gameOver || songEnd)
    {
      if (checkKey(players.get(0).button1) && restartButt1 == false)
      {
        replay();
      }
      if (checkKey(players.get(0).button2) && restartButt1 == false)
      {
        returnMainMenu();
      }
    }
    if( checkKey(players.get(0).button1) || checkKey(players.get(1).button2))
    {
     restartButt1 = true; 
    }
  }

  void display()
  {
    if (displayed == true)
    {
      stroke(255);
      noFill();
      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      if (index == 0 || index == 2)
      {
        box(pWidth, pHeight, len);
      } else
      {
        box(pHeight, pWidth, len);
      }
      popMatrix();
    }
  }
}

void PlatformInit()
{
  for (int i = 0; i < 4; i++)
  {
    platforms[i] = new Platform(i);
  }
}

void PlatformMove()
{  

  for (int i = 0; i < 4; i++)
  {
    int platSpawn = 0;

    if (platforms[i].displayed == false && platNum !=4)
    {
      platSpawn = int(random(1, 61));
    }
    if ((platSpawn == 30 || platNum < 2 ) && platforms[i].displayed == false )
    {
      platforms[i].displayed = true; 
      platNum++;

      float tempX= width/2;
      float tempY = height - 50; 
      platforms[i].len = (int)random(2000, 10000);

      if (i != 0)
      {
        float rot = PI/2 * i;
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
        platforms[i].pos.x = X1 + width/2;
        platforms[i].pos.y = Y1 + height/2;

        platforms[i].pos.z = -5000 - (platforms[i].len /2);//set z
      } else
      {
        platforms[i].pos.x = width/2;
        platforms[i].pos.y = height - 50; 
        platforms[i].pos.z = 0;
        platforms[i].len = 10000;
      }
    }
  }
}


