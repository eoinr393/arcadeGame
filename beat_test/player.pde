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
    if ((checkKey(up)) && keyUp)
    {
      pos.y -= 20;
      keyUp = !keyUp;
    }
    if(!checkKey(up))
    {
       keyUp = true; 
    }
    
    if ((checkKey(down)) && keyDown)
    {
      pos.y += 20;
      keyDown = !keyDown;
    }
    if(!checkKey(down))
    {
       keyDown = true; 
    }
    
    if ((checkKey(left)) && keyLeft)
    {
      pos.x -= 20;
      keyLeft = !keyLeft;
    }
    if(!checkKey(left))
    {
       keyLeft = true; 
    }
    
    if ((checkKey(right)) && keyRight)
    {
      pos.x += 20;
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
