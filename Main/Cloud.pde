class Cloud{
    
  float x;
  
  Cloud(){
    this.x = width+20;
  }
  
  public void show()
  {
    image(c_img,this.x,50,100,50);
  }
  
  public void move()
  {
    this.x -= speed/2;
    if(this.x<=-120)
      this.x = width+20;
  }
}
