float angle = PI/8;
void setup(){
  size(400,400);
}

void draw(){
  frameRate(10);
  background(100);
  stroke(255);
  translate(200,height);
  branch(100);
}

void branch(float len){
  
  line(0,0,0,-len);
  translate(0,-len);
  if(len>4){
    push();
    rotate(angle);
    branch(len*0.67);
    pop();
    
   if(frameCount%2==0){
    
    push();
    rotate(-angle);
    branch(len*0.67);
    pop();
  }
  }
}
