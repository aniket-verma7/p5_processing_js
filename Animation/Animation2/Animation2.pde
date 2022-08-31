int k=8;
int in = 1;
void setup(){
  size(500,500);
  frameRate(10);
}

void draw(){
  background(255);
  beginShape();
  translate(width/2,height/2);
  noFill();
  for(float i=0;i<TWO_PI*10;i+=0.02){
    float r = 200*cos(i*k);
    float x = r * cos(i);
    float y = r * sin(i);
    //line(x,y,x,y+20);
    vertex(x,y);
  }
  endShape(CLOSE);
  k+=in;
  if(k>100 || k<5)in*=-1;
}
