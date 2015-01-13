ArrayList<Platform> platforms = new ArrayList<Platform>();
float moveSpeed = 1;

class Platform
{
   PVector pos;
   int index;
   //int side;
   float len;
   
   Platform()
   {
     pos = new PVector(height/2, width/2);
     len = int(random(200,500));
   }    
   
   Platform(int index)
   {
     this();
     this.index = index;
   }
   
   void update()
   {
       moveSpeed += 1;
   }
   
   void display()
   {
      stroke(255);
      noFill();
      pushMatrix();
      translate(pos.x,pos.y,moveSpeed);
      box(200, 20, len);
      popMatrix();
   }
   
}

void PlatformInit()
{
  int platNum = 1;  

  for(int i =0; i < platNum; i++)
  {
    Platform pl = new Platform(i);
    pl.pos.x = width/2;
    pl.pos.y = height - 50;
    pl.len = 10000;
    platforms.add(pl);
  } 
 }
