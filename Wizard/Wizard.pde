Snake s; //<>//
int fx , fy;
void setup()
{
  frameRate(10);
  size(600,600);
  cal();
  s = new Snake();
}

void draw()
{
  background(0);  
  s.update();
  s.show();
  printFood();
  if(s.eat(fx,fy))cal();
  
  
}

void keyPressed()
{
  if(key == 'w')s.changeDir(0,-1);
  if(key == 's')s.changeDir(0,1);
  if(key == 'a')s.changeDir(-1,0);
  if(key == 'd')s.changeDir(1,0);
}

void printFood()
{
  fill(255,0,0);
  rect(fx*30,fy*30,30,30);
}

void cal()
{
  fx = 1+(int)random(18);
  fy = 1+(int)random(18);
  

}
