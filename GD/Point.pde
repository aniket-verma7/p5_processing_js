class Point
{
  float x,y;
  
  Point(float x,float y)
  {
    this.x = x/width;
    this.y = y/height;
  }
  
  void show()
  {
    circle(this.x*width,this.y*height,10);
  }
}
