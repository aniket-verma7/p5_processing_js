class RemoteDetails
{
  boolean active;
  String id;
  float x,y;
  RemoteDetails(String id)
  {
    this.id=id;
    this.active = false;
  }
  
  void setPoint(float x,float y)
  {
    this.x=x;
    this.y=y;
  }
  
  boolean isActive()
  {
    return active;
  }
  void setActive(boolean active)
  {
    this.active=active;
  }
  String getId(){return this.id;}
  float getX(){return this.x;}
  float getY(){return this.y;}
  
  void drawButton()
  {
    push();
    translate(x,y);
    textSize(30);
    fill(0);
    text(id,100,38);
    fill(0,190,0);
    rect(250,10,155,50,10);
    fill(0);
    textSize(20);
    text("BREYTA KODA",260,40);
    
    fill(190,0,0);
    rect(450,10,155,50,10);
    fill(0);
    textSize(20);
    text("BREYTA KODA",460,40);
    
    pop();
  }
  
}
