class Point
{
  float x, y;
  float r;
  float angle;
  float speed;
  color c;

  Point() {
    x = random(10, width-10);
    y = random(10, height-10);
    r = random(1, 4);
    speed = random(1, 2);
    angle = random(0, 360);
  }

  void show()
  {
    c = color(dist(x,y,width/2,height/2), 100, 100);
    fill(c);
    noStroke();
    circle(x, y, r*3);
  }

  void update()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);

    if (x>width || x<0)speed*=-1;
    if (y>height || y<0)speed*=-1;
  }
}
