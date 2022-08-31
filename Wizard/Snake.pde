import java.util.ArrayList;
class Snake
{
  float x=10,y=10;
  int len=0;
  int tmp = 30;
  int xS = 1;
  int yS = 0;
  float tx[] = new float[100];
  float ty[] = new float[100];
  void show()
  {
    
    fill(90,255,200);
     for(int i=0;i<this.len;i++)
     {
       rect(this.tx[i]*30,this.ty[i]*30,30,30);
     }
     fill(90,255,100);
     rect(this.x*30,this.y*30,30,30);
  }
  
  void changeDir(int x,int y)
  {
    this.xS = x;
    this.yS = y;
  }
  
  boolean eat(int fx,int fy)
  {
    float d = dist(this.x,this.y,fx,fy);
    if(d<1){
      this.len+=1;
      return true;
    }
    return false;
  }
  
  void update()
  {
    println();
   for(int i=this.len;i>=1;i--)
   {
     this.tx[i] = this.tx[i-1];
     this.ty[i] = this.ty[i-1];
   }
   
    tx[0] = x;
    ty[0] = y;
    this.x += this.xS;
    this.y += this.yS;
    
    if(x>=20)x=0;
    else if(x<0)x=20;
    
    if(y>=20)y=0;
    else if(y<0)y=20;
  }
}
