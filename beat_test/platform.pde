Platform platforms[] = new Platform[4];
float moveSpeed = 1;
int platNum;

class Platform
{
   PVector pos;
   int index;
   //int side;
   float len;
   boolean displayed = false;
   
   Platform()
   {
     pos = new PVector(height/2, width/2,-100);
     len = int(random(200,500));
   }    
   
   Platform(int index)
   {
     this();
     this.index = index;
   }
   
   void update()
   {
       moveSpeed += 0.01;
       pos.z += moveSpeed;
       
       //see if its displayed or not
       if(pos.z - len < -(len/2))
       {
          displayed = true; 
          print(displayed, "\n", pos.z ,"\n" );
       }
       else
       {
          displayed = false; 
       }
   }
   
   void display()
   {
      stroke(255);
      noFill();
      pushMatrix();
      translate(pos.x,pos.y,pos.z);
      box(200, 20, len);
      popMatrix();
   }
   
}

void PlatformInit()
{  
  
  for(int i =0; i < 4; i++)
  {
    platforms[i] = new Platform();
    
    platforms[i].pos.x = width/2;
    platforms[i].pos.y = height - 50;
    platforms[i].pos.z = -100;
    platforms[i].len = 10000;
    
  } 
 }
