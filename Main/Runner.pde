class Runner{
  
  float x,y,h,w;
  int health,score,f;
  float gravity,y_vel,level,lastHit;
  int cnt;  
    
  Runner(){
    this.x = 100;
    this.h = 150;
    this.level = height-h-80;
    this.y = this.level;
    this.w = 90;
    this.f = 0;
    this.lastHit = 0;
    this.health = 5;
    this.score = 0;
    this.gravity = 0.7;
    this.y_vel = 0;
    this.cnt = 0;
  }
  
  public void show()
  {
    image(runnerImage[cnt],this.x,this.y,this.w,this.h);
    if(this.y!=this.level)cnt = 2;
    else if(frameCount%10 == 0)cnt+=1;
    if(cnt==6)cnt = 0;
  }
  
 public void move(){
    this.y_vel += this.gravity;
    this.y += this.y_vel;
    if(this.y>=this.level){
      this.y=this.level;
      this.y_vel=0;
    }
  }
  
 public void jump(){
    if(this.y==this.level)
      this.y_vel = -15;
     
  }
  
  public void hit(Stone stone){
    if(dist(this.x+this.w/2,this.y+this.h,stone.x+stone.w/2,stone.y+stone.h/2)<stone.w){
      if(this.y>=this.level&&frameCount-this.lastHit>50){
        this.health--;
        this.lastHit = frameCount;
      }
    }
  }
  
  public void hitcoin(Coin coin){
    if(dist(this.x+this.w/2,this.y+this.h/2,coin.x,coin.y)<this.w){
        coin.x = width+20;
        this.score++;
    }
  }
  
}
