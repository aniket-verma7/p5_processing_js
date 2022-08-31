class Player{
  String name;
  int point;
  color c;
  float x,y;
  
  Player(String name,color c,float x,float y)
  {
    this.name = name;
    this.point = 0;
    this.c = c;
    this.x=x;
    this.y=y;
  }

  
  void showPlayer()
  {
    fill(c);
    textSize(20);
    text(name,x,y);
    
    text(point,x+20,y+20);
  }
  
  void setPoint(int point)
  {
    this.point = point;
  }
}
