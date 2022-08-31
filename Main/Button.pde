class Button{
  
  float x,y,w,h,lenW,lenH;
  String text;
  
  Button(float x,float y,float w,float h,String text){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;   
    this.text = text;
    this.lenW = this.x+this.w;
    this.lenH = this.y+this.h;
  }
  
  public void show()
  {
     fill(255, 165, 0);
     rect(this.x,this.y,this.w,this.h,3);
     textSize(20);
     fill(0);
     int offset = this.text.length();
     text(this.text,this.x+this.w/offset+2,this.y+this.h/2);
  }
  
  public boolean isClicked()
  {
    if(mouseX>=this.x && mouseX<=this.x+this.w && mouseY>=this.y && mouseY<=this.y+this.h)
      return true;
    return false;
  }
  
}
