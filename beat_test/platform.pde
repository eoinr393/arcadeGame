Platform platforms[] = new Platform[4];
float moveSpeed = 1;
int platNum;

class Platform
{
   PVector pos;
   int index;
   float len;
   float pWidth = 200;
   float pHeight = 20;
   boolean displayed = false;
   
   Platform()
   {
     pos = new PVector(height/2, width/2,-100);
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
      if(index == 0 || index == 2)
      {
        box(200, 20, len);
      }
      else
      {
         box(20, 200, len); 
      }
      popMatrix();
   }
   
}

void PlatformInit()
{  
  
  for(int i = 0; i < 4; i++)
  {
    platforms[i] = new Platform(i);
    
    float tempX= width/2;
    float tempY = height - 50; 
    platforms[i].pos.z = -100;
    platforms[i].len = 10000;
    platforms[i].displayed = true;
    
   if(i != 0)
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
       
       platforms[i].pos.z = -100;//set z
       
    }
    else
    {
        platforms[i].pos.x = width/2;
        platforms[i].pos.y = height - 50; 
    }
  } 
 }
