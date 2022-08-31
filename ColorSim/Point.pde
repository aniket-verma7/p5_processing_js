class Point
{
  float x,y;
  float angle = random(-100,100);
  float   speed = random(3,4)+random(0,1);

  float xvel;
  float yvel;
  
  
  Point()
  {
    this.x=width/2;
    this.y=height/2;
  }
  
  void update()
  {
    xvel = speed * sin(degrees(angle));
    yvel = speed * cos(degrees(angle));
    x+=xvel;
    y+=yvel;

    if(x>width || x<0)speed*=-1;
    if(y>height || y<0)speed*=-1;

  }  
}
