ArrayList<Block> blocks = new ArrayList<Block>();

class Block
{
  PVector pos;
  //int index;
  int platform;
  float sizeX = 20;
  float sizeY = 20;
  //boolean hit;
   
  Block()
  {
    pos = new PVector(width/2,height/2, -500);  
  } 
  
  Block(int platform)
  {
    this();
    this.platform = platform;
  }
  
  void update()
  {
     pos.z += moveSpeed;
  }
  
  void display()
  {
     pushMatrix();
     stroke(200,0,100);
     noFill();
     translate(pos.x,pos.y,pos.z);
     box(sizeX,sizeY,sizeX);
     popMatrix();
     
  }
}

void blockInit()
{
    for(int i = 0; i < 4; i++)
    {
      if(platforms[i].displayed == true)
      {
          Block bl = new Block(i);
          
          int row = int(random(1,5));
          
          bl.pos.x = platforms[0].pos.x + row * bl.sizeX;
          bl.pos.y = platforms[0].pos.y + bl.sizeY;
          
          if(i != 0)
          {
             float rot = PI/2 * i;
             float s = degrees(sin(rot));//get the sin in degrees
             float c = degrees(cos(rot));//get the cos in degrees
             
             //take the rotation point from the point to rotate so
             //its now rotating around the origin
             bl.pos.x -= width/2;
             bl.pos.y -= height/2;
             
             float X1 = bl.pos.x * c - bl.pos.y * s;//rotate the the right x position
             float Y1 = bl.pos.x * s + bl.pos.y * c;//rotate to the right y position
             
             //add back the point so the new x and y are at their 
             //new respective positions
             bl.pos.x = X1 + width/2;
             bl.pos.y = Y1 + height/2;
             
             bl.pos.z = -1000;//set z
          }
          blocks.add(bl);  
          print("block created");
      }
    }
 }

