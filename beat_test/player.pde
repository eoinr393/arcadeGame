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
  float toMove = (platforms[0].pWidth / 4) - 5;
  color colour;
  boolean keyUp, keyDown, keyLeft, keyRight;
    
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
    if (((checkKey(up)) && keyUp) && (side == 1 || side == 3))
    {
        pos.y -= toMove;
        keyUp = !keyUp;
    }
    if(!checkKey(up))
    {
       keyUp = true; 
    }
    
    if (((checkKey(down)) && keyDown) && (side == 1 || side == 3))
    {
      pos.y += toMove;
      keyDown = !keyDown;
    }
    if(!checkKey(down))
    {
       keyDown = true; 
    }
    
    if (((checkKey(left)) && keyLeft) && (side == 0 || side == 2))
    {
      pos.x -= toMove;
      keyLeft = !keyLeft;
    }
    if(!checkKey(left))
    {
       keyLeft = true; 
    }
    
    if (((checkKey(right)) && keyRight) && (side == 0 || side == 2))
    {
      pos.x += toMove;
      keyRight = !keyRight;
    }
    if(!checkKey(right))
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
  
    if(checkKey(button1) && checkKey(left))
    {
        
       if(side == 0)
       {
         pos = playerRotate(PI/2,pos.x,pos.y);
       }
       if(side == 2)
       {
         pos = playerRotate(PI + PI/2,pos.x,pos.y);
       }
       if(side == 3)
       {
         pos = playerRotate(PI,pos.x,pos.y);
       }
       
       side = 1;
    }
    if(checkKey(button1) && checkKey(up))
    {
      if(side == 0)
       {
         pos = playerRotate(PI,pos.x,pos.y);
       }
       if(side == 1)
       {
         pos = playerRotate(PI/2,pos.x,pos.y);
       }
       if(side == 3)
       {
         pos = playerRotate(PI + PI/2,pos.x,pos.y);
       } 
     
      side = 2;  
    }
    if(checkKey(button1) && checkKey(right))
    {
       if(side == 0)
       {
         pos = playerRotate(PI/2 + PI,pos.x,pos.y);
       }
       if(side == 2)
       {
         pos = playerRotate(PI/2,pos.x,pos.y);
       }
       if(side == 1)
       {
         pos = playerRotate(PI,pos.x,pos.y);
       } 
       
       side = 3;
    }
    if(checkKey(button1) && checkKey(down))
    {
        if(side == 1)
       {
         pos = playerRotate(PI/2 + PI,pos.x,pos.y);
       }
       if(side == 2)
       {
         pos = playerRotate(PI,pos.x,pos.y);
       }
       if(side == 3)
       {
         pos = playerRotate(PI/2,pos.x,pos.y);
       }
       
       side = 0;
    }
    
  }
  
  void display()
  {    
    stroke(colour);
    noFill(); 
    pushMatrix();
    translate(pos.x, pos.y, 0);   
    box(20);
    popMatrix();
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
   
   PVector rotPos = new PVector(x,y);
   
   return(rotPos);
  
}
