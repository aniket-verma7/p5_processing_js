ArrayList<Point> points = new ArrayList<Point>();
float b = 0;
float m = 1;
float alpha = 0.01;
float cost=0;
void setup()
{
  size(800,800);
}

void draw()
{
  background(200);
  
  for(Point point:points)
  {
    point.show();
  }
  
  float x1 = 0;
  float y1 = m * x1 + b;
  float x2 = 1;
  float y2 = m * x2 + b;
  line(x1 * width, y1 * height, x2 * width, y2 * height);
  
  
  
  for(Point point:points)
  {
    costFunction();
    b = b - alpha * cost;
    m = m - alpha * cost * point.x;
  }
}

void mousePressed()
{
  points.add(new Point(mouseX,mouseY));
}

void costFunction()
{  
  float sum=0;
  for(Point point:points)
  {
    float h = b + m * point.x;
    float p = h - point.y;
    sum += p;
  }
  cost = sum/(points.size());
}
