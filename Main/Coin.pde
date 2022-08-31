 class Coin{
   float x,h,y,w;
   
  Coin(float x){
    this.x = x;
    this.h = 25;
    this.y = height/2-this.h-24;
    this.w = 25;
  }
  
  public void show()
  {
    image(coin_img,this.x,this.y,this.w,this.h);
  }

  public void move()
  {
    this.x-=speed;
    if(this.x<=-this.w)
      this.x = width+this.w+random(-20,20);
  }
  
}
