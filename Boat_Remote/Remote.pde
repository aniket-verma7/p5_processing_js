class Remote implements Runnable
{
  String id;
  int time;
  int endTime;
  float x,y;
  int m,s;
  String disTime = "00:00";
  boolean running = false;
  color c = color(100,100,100);
  Remote(){}
  Remote(String id,int time)
  {
    this.id=id;
    this.time=time;
  }
  
  void setPoint(float x,float y)
  {
    this.x=x;
    this.y=y;
  }
  
  int getTime()
  {
    return this.time;
  }
  public void run()
  {
    running = true;
    try 
    {
      while(time>0)
      {
          time-=1;
         
          if(s==0 && time>0)
          {
            m-=1;
            s=59;
          }else  s-=1;
          
          if(time>0 && time<endTime)c = color(200,0,0);
          else c = color(0,200,0);
          
          if(m<10)disTime="0"+m+":";
          else disTime=m+":";
         
          if(s<10)disTime+="0"+s;
          else disTime+=s;
          
          delay(1000);
      }
      c = color(100,100,100);
      running = false;
    }
    catch (Exception e) 
    { 
      System.out.println("Exception : "+e.getLocalizedMessage());
    }
  }
  
  public boolean isRunning()
  {
    return running;
  }
  public void halt() 
  { 
    time=-1; 
    running = false;
    c = color(100,100,100);
  } 
    
  float getX(){return this.x;}
  float getY(){return this.y;}
  String getId(){return this.id;}
  
  void setTime(int time)
  {
    s=time%60;
    m=time/60;
    
    if( m<10)disTime = "0"+m+":";
    else disTime = m+":";
    
    if(s<10)disTime += "0"+s;
    else disTime += s;

    this.time = time;
  }
  
  void setEndTime(int endTime)
  {
    this.endTime = endTime;
  }
  
  void drawRemote()
  {
    push();
    fill(30);
    strokeWeight(3);
    stroke(c);
    rect(x,y,200,150,7);
    pop();
  }
  
  void drawButton()
  {
    push();
    translate(x,y);
    fill(255);
    fill(0,180,0);
    rect(10,100,85,40,7);
    fill(255,0,0);
    rect(105,100,85,40,7);
    pop();
  }
  
  void displayNameAndTime()
  {
    push();
    translate(x,y);
    fill(255);
    textSize(25);
    text(id,65,50);
    textSize(12.5);
    text(disTime,85,70);
    push();
    textSize(20);
    text("Start",30,125);
    text("Stop",125,125);
    pop();
    pop();
  }
}
