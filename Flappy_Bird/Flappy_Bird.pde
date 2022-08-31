PImage back,bird,pipe,pipeFlip;
PFont font;
float x=100,y=300;
float gravity=.8;
float yVelocity;
float pipeX[] = new float[5];
float pipeY[] = new float[5];
final float pipeGap = 150,pipeWidth = 50;
int score = 0;
boolean game = true;
void setup()
{
  frameRate(60);
  size(450,700);
  back = loadImage("assets/back.jpeg");
  bird = loadImage("assets/bird.png");
  pipe = loadImage("assets/pipe.png");
  pipeFlip = loadImage("assets/pipeFlip.png");
  font = createFont("assets/myFont.ttf",32);
  pipeX[0] = width+300;
  pipeY[0] = random(300,400);
  for(int i=1;i<pipeX.length;i++)
  {
      pipeX[i] = pipeX[i-1]+pipeWidth+pipeGap;
      pipeY[i] = random(300,400);
  }
}
void draw()
{
  if(game)
  {
    background(0,0,0);
    //gameBackGround();
    displayBird();
    displayNewPipe();
    showScore();
    gameOver();  
}
  
}
void gameBackGround()
{
    imageMode(CORNER);
    image(back,0,0,width,height);
}

void gameOver()
{
  if(y<0 || y>height)game = false;
}
void displayBird()
{
    imageMode(CENTER);
    image(bird,x,y,40,35);
    y = y + yVelocity;
    yVelocity += gravity;
}

void displayNewPipe()
{
    for(int i=0;i<5;i++)
    {
        imageMode(CENTER);
        //image(pipeFlip,pipeX[i],0,pipeWidth,pipeY[i]);
        fill(255,255,255);
        rect(pipeX[i],0,pipeWidth,pipeY[i]);
        if(x==pipeX[i]-20 && y<pipeY[i])game = false;
        if(x==pipeX[i]-20 && y>pipeY[i]+pipeGap)game = false;
        if((x>=pipeX[i] && x<=pipeX[i]+pipeWidth) && (y>pipeY[i]+pipeGap || y<pipeY[i]))game = false;
        
        //image(pipe,pipeX[i],pipeY[i]+pipeGap,pipeWidth,height-pipeY[i]-pipeGap);
        rect(pipeX[i],pipeY[i]+pipeGap,pipeWidth,height-pipeY[i]-pipeGap);
        pipeX[i]-=5;
        
        if(pipeX[i]<-width/3)
        {
            pipeX[i]=width+150;
            pipeY[i] = random(300,400);
        }
    }
}
void  showScore()
{
  fill(255,255,255);
  textFont(font);
  textSize(80);
  text(score,220,100);
}

void mousePressed()
{
  yVelocity = -10;
  if(!game)
  {
    x=100;y=300;score=0;
    pipeX[0] = width+300;
    pipeY[0] = random(300,400);
    for(int i=1;i<pipeX.length;i++)
    {
        pipeX[i] = pipeX[i-1]+pipeWidth+pipeGap;
        pipeY[i] = random(300,400);
    }
    yVelocity=0;
    game = true;
  }
}
