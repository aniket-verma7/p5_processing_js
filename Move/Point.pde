class Point
{
  float x,y;
  float angle;
  float speed = 1.5;
  color c = 255;
  
  Point()
  {
    this.x=width/2;
    this.y=height/2;
  }
  
  void update()
  {
    stroke(c);
    x+= speed * cos(angle*2);
    y+= speed * sin(angle*2);
    
    if(x>width-50 || x<50)speed*=-1;
    if(y>height-50 || y<50)speed*=-1;
  }  
}
