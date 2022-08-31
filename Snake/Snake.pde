int x=350,y=350;
char dir = 'd';
int fx=int(random(740));
int fy=int(random(720));
int score = 0 ;
int size=0;
String play="Play",pause="Pause";
int tx[] = new int[100];
int ty[] = new int[100];
int flag=0,temp=0;
boolean p = false;
int gameOver=0;
void setup()
{
  frameRate(10);
  size(800,900);
}

void draw()
{
    if(!p)
    {
      makeSnakeBoard();
      displayScore();
      moveSnake();
      appendTail();
      displayFood();
      checkRange();
      displaySnake();
      gameOver();
    }
}

void makeSnakeBoard()
{
    background(200,200,200);
    noStroke();
    fill(0,0,0);
    rect(50,30,700,700);
}
void displaySnake()
{
    fill(255,255,255);
    noStroke();
    rect(x,y,20,20);
}
void displayScore()
{
    stroke(10);
    fill(200,200,200);//score
    rect(50,740,400,140);
    fill(0,0,0);
    textSize(40);
    text("Score : "+score,70,800);
}

void moveSnake()
{   
    for(int i=size-1;i>=1;i--)
    {
        tx[i]=tx[i-1];
        ty[i]=ty[i-1];
    }
    tx[0]=x;
    ty[0]=y;
    
    if(dir=='w')y-=10;
    if(dir=='s')y+=10;
    if(dir=='a')x-=10;
    if(dir=='d')x+=10;
  
    if(x==fx && y==fy)
      {
        size+=1;
        score+=5;
        fx=int(random(740));
        fy=int(random(720));
      }
}

void reset()
{
  x=350;y=350;
  dir = 'd';
  fx=int(random(740));
  fy=int(random(720));
  score = 0 ;
  size=0;
  flag=0;temp=0;
  p = false;
  gameOver=0;
}
void gameOver()
{
   fill(0,0,0);
   textSize(50);
  for(int i=0;i<size;i++)
  {
    if(x== tx[i] && y == ty[i])
    {
          flag=-1;
          break;
    }
  }
  
  if(flag==-1)
  {
    p=true;
    gameOver=1;
    clear();
    fill(255,255,255);
    text("High Score : "+score,225,300);
    text("Press R to Replay",190,370);
    text("Game Over",255,435);
  }
  
  
}

void appendTail()
{
  noStroke();
  fill(255,255,255);
  for(int i=0;i<size;i++)
   rect(tx[i],ty[i],20,20);
}
void displayFood()
{
      fill(255,0,0);
      fx = fx - (fx%10);
      fy = fy - (fy%10);
      checkFoodRange();
      rect(fx,fy,20,20);
}
void checkFoodRange()
{
  if(fx<60)fx+=300;
  if(fx>740)fx-=300;
  if(fy>720)fy-=300;
  if(fy<40)fy+=300;
}
void checkRange()
{
  if(x>737)x=60;
  else if(x<60)x=730;
  if(y>719)y=40;
  else if(y<40)y=720;
}
void keyPressed()
{
    if(key=='w')dir='w';
    if(key=='s')dir='s';
    if(key=='a')dir='a';
    if(key=='d')dir='d';
    if(key=='R' || key=='r')reset();
    if(key==ENTER && temp==0 && gameOver==0)
    {
        text(pause,525,800);
        p=true;
        temp=1;
    }
     else if(key==ENTER && temp==1 && gameOver==0){p=false;temp=0;}
}
