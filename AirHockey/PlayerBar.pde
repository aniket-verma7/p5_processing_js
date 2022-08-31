class PlayerBar
{
  float x,y;
  float w,h;
  color c;
  PlayerBar(float x,float y,float w,float h,color c)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  void show()
  {
    fill(c);
    rect(x,y,w,h);
  }
    
  float getX(){return x;}
  float getY(){return y;}
  float getW(){return w;}
  float getH(){return h;}
  void moveLeft(){
    if(x-10>20)
      x-=10;
    
  }
  
  void moveRight(){
    if(x+10<230)
      x+=10;
  }
}
