ArrayList<Block> blocks = new ArrayList<Block>();

class Block
{
  PVector pos;
  //int index;
  int platform;
  float sizeX = (platforms[0].pWidth / 4) - 5;
  float sizeY = (platforms[0].pWidth / 4) - 5;
  //boolean hit;
   
  Block()
  {
    pos = new PVector(0,0, -5000);  
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
      if(platforms[i].pos.z - (platforms[i].len /2 ) <= -5000)
      {
          Block Bl = new Block(i);
          
          int row = int(random(0,4));
          
          Bl.pos.x = (platforms[0].pos.x - (platforms[0].pWidth / 2)) + (row * platforms[0].pWidth/4) + (platforms[0].pWidth/4)/2;//set the x position, 4 rows for the blocks to spawn
          Bl.pos.y = platforms[0].pos.y - Bl.sizeY;
          
          if(i != 0)
          {
             float rot = PI/2 * i;
             float s = sin(rot);//get the sin
             float c = cos(rot);//get the cos
             
             //take the rotation point from the point to rotate so
             //its now rotating around the origin
             Bl.pos.x -= width/2;
             Bl.pos.y -= height/2;
             
             float X1 = Bl.pos.x * c - Bl.pos.y * s;//rotate the the right x position
             float Y1 = Bl.pos.x * s + Bl.pos.y * c;//rotate to the right y position
             
             //add back the point so the new x and y are at their 
             //new respective positions
             Bl.pos.x = X1 + width/2;
             Bl.pos.y = Y1 + height/2;
             
             Bl.pos.z = -5000;//set z
             print("block", i , "created");
          }
          blocks.add(Bl);  
      }
    }
 }

