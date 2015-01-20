ArrayList<Point> points = new ArrayList<Point>();

class Point
{
  int points = 0;
  int bonus = 0;
  PVector pos;

  Point()
  {
    pos = new PVector(0,0);
  }

  Point(int points, int bonus)
  {
    this();
    this.points = points;
    this.bonus = bonus;
  }

  void update()
  {
    points += (int)moveSpeed;
  }

  void display()
  {
    text(points, pos.x,150);
  }
}

void pointsInit()
{
   for(int i = 0; i < players.size(); i++)
   {
      Point pt = new Point();
      pt.pos.x = 150 + (i * (width/2));
      points.add(pt);
   } 
}

