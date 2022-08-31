class Ball{
  float x;
  float y;
  float r;
  color c;
  
  float speedX = random(3,4);
  float speedY = random(3,4);
  Ball(float x,float y,float r,color c)
  {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }
  
  void show()
  {
    fill(c);
    circle(x,y,r);
  }
  
  void update()
  {
    x+=speedX;
    y+=speedY;
    if( x>width-20 || x<20 )speedX *=-1;
    if(y>460 || y<20 )speedY*=-1;
  }
  
  void rebound(PlayerBar bar,int id)
  {
    float tempX = x+r;
    float tempY = 0;
    if(id==1)
       tempY = y+10;
    else 
        tempY = y-20;  
    
    if(id==1 && tempX >=bar.getX() && tempX<=bar.getX()+bar.getW() && tempY>bar.getY())
      speedY*=-1;
     if(id==2 && tempX >=bar.getX() && tempX<=bar.getX()+bar.getW() && tempY<bar.getY())
      speedY*=-1;    
  }
   
  void score(int id)
  {
    float tempX = x+r;
    float tempY = 0;
    if(id==1)
       tempY = y+12;
    else 
        tempY = y-17;  
    if(id==1 && tempX>=90 && tempX<=235 && tempY>465)
      player2.point += 1;
    
    else if(id==2 && tempX>=90 && tempX<=235 && tempY<10)
      player1.point +=1;
  }
}
