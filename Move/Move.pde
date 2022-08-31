int size = 500;
Point[] point = new Point[size];

void setup()
{
  size(600,600);
  frameRate(144);
  for(int i=0;i<size;i++)
  {
    point[i] = new Point();
    point[i].angle = i*360/size; 
  }
}

void draw()
{
  background(0);
  point[0].update();
  for(int i=1;i<size;i++)
  {
   point[i].update();
   line(point[i].x,point[i].y,point[i-1].x,point[i-1].y);
   //point(point[i].x,point[i].y);
  }
}
