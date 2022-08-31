class Ground{
  
  float x;
  
  Ground(){
    this.x = 0;
  }
  
  public void show(){
    image(g_img,this.x,height-level,width,level);
    image(g_img,this.x+width-1,height-level,width,level);
  }
  
  public void move(){
    this.x -= speed;
    if(this.x<=-width)
      this.x = 0;
  }
}
