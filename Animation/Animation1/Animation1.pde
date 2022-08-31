ArrayList<Point> points = new ArrayList<Point>(); 
void setup()
{
  frameRate(40);
  colorMode(HSB,360,100,100);
  size(500,500);
  for(int i=0;i<250;i++){
    points.add(new Point());
  }
}

void draw()
{
  
  //saveFrame("output/####.png");
  background(0);
  points.get(0).show();
  points.get(0).update();
  for(int i=1;i<points.size();i++){
    Point p1 =  points.get(i-1);
    Point p2 =  points.get(i);
    points.get(i).show();
    points.get(i).update();
    
    for(Point point:points)
    {
      stroke(point.c);
      if(dist(p1.x,p1.y,point.x,point.y)<=25)
        line(p1.x,p1.y,point.x,point.y);
        
      if(dist(p2.x,p2.y,point.x,point.y)<=10)
        line(p2.x,p2.y,point.x,point.y);
    }
    
  }
}
