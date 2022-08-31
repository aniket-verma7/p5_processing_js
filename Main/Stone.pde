 class Stone{
   float x,h,y,w;
   
  Stone(float x){
    this.x = x;
    this.h = 60;
    this.y = height-level-this.h+24;
    this.w = 70;
  }
  
  public void show(){
    image(s_img,this.x,this.y,this.w,this.h);
  }

  public void move(){
    this.x-=speed;
    if(this.x<=-this.w)
      this.x = width+this.w+random(-20,20);
  }
  
}
