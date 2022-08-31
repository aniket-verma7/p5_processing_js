import processing.sound.*;

SoundFile song;
Amplitude amp; 
float ampValue;
float radius = 150;
int type=1;
float change=255;
ArrayList<Float> ampHistory = new ArrayList<Float>();
float offset=0,speed=0.001;
void setup()
{
   size(800, 800);
   song = new SoundFile(this, "file.mp3");
   song.play(); 
    
   amp = new Amplitude(this);
   amp.input(song);
   
   colorMode(HSB, 360, 360, 100, 100);
}

void draw()
{
   background(0);
   ampValue = amp.analyze();
   graph();
   
   float sec = millis()*0.001;
   
   if(sec>30 && sec<50)type=2;
   else if(sec>50 && sec<80)type=3;
   else if(sec>80 )type=4;

   if(type==1)type1();
   else if(type==2)type2();
   else if(type==3)type3();
   else if(type==4)type4();
   
   if(change<0)change=255;
   else change-=1.05;
   
   offset+=speed;
}

void graph()
{
   ampHistory.add(ampValue);
   push();
   noFill();
   noStroke();
   rect(0,600,width,120);
   stroke(255,200*ampValue);
   translate(0,600);
   beginShape();
   strokeWeight(1.5);
   for(int i=0;i<ampHistory.size();i++)
   {
     float y = map(ampHistory.get(i),0,1,10,100);
     vertex(i,y);
   }
   endShape();
   pop();
   if(ampHistory.size()>width)
   {
       ampHistory.remove(0);
   }
}

void type1()
{  
    translate(width/2, height/2-100);
    int size = ampHistory.size();
    if(size>100)size=100;
    float angle = offset;
    fill(change*ampValue,change*ampValue,change*ampValue);
    circle(0,0,70);
    fill(change,255,255);
    circle(0,0,ampValue*50);
    
    push();
    fill(change, 255, 255);
    for(int i=0;i<size;i++)
    {    
        float x = radius*cos(angle);
        float y = radius*sin(angle);
        rotate(angle);
        circle(x,y,ampValue*50);
    }
    pop();
    
}

void type2()
{
    translate(width/2, height/2-100);
    int size = ampHistory.size();
    if(size>50)size=50;
    float angle = offset;
    rotate(angle*ampValue);
    fill(change*ampValue,change*ampValue,change*ampValue);
    rect(-35,-30,70,70);
    fill(change,255,255);
    rect(-25,-20,50,50);
    
    push();
    fill(change, 255, 255);
    for(int i=0;i<size;i++)
    {    
        float x = radius*cos(angle);
        float y = radius*sin(angle);
        rotate(angle);
        rect(x,y,ampValue*50,ampValue*60);
    }
    pop();
}

void type3()
{
    translate(width/2, height/2-100);
    push();
    fill(change, 255, 255);
    stroke(255);
    
    for(int i=80;i<=320;i+=80)
    {
      if(i==80)fill(255);
      else noFill();
      circle(0,0,i*ampValue);
    }
    
    pop();
    
}

void type4()
{  
   translate(width/2, height/2-100);
   push();
   beginShape();
   noFill();
   stroke(change*ampValue,change*ampValue,255);
   for(int i=0;i<360;i++)
   {
     float r = map(ampHistory.get(i),0,1,10,100);
     float x = r*cos(i);
     float y = r*sin(i);
     vertex(x,y);
   }
   endShape();
   pop();
   if(ampHistory.size()>360)
   {
       ampHistory.remove(0);
   }
}
