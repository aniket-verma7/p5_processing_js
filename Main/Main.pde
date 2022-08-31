int level = 100;
int speed = 5;

boolean gameOver = false;
Cloud cloud;
Ground ground;
Stone stone,stone2;
Coin c1,c2;
Runner runner;
int high_score = 0;
ArrayList<Button> buttons;
String[] label = {"Start","Pause","Resume","Restart"};
boolean start = false;
boolean pause = false;
boolean restart = false;
PImage r_img,s_img,c_img,g_img,h_img,coin_img;
PImage[] runnerImage;

void preload(){
  
  runnerImage = new PImage[6];
  runnerImage[0] = loadImage("pics/runner1.png");
  runnerImage[1] = loadImage("pics/runner2.png");
  runnerImage[2] = loadImage("pics/runner3.png");
  runnerImage[3] = loadImage("pics/runner4.png");
  runnerImage[4] = loadImage("pics/runner5.png");
  runnerImage[5] = loadImage("pics/runner6.png");
  
  s_img  = loadImage("pics/rock.png");
  c_img  = loadImage("pics/cloud.png");
  g_img = loadImage("pics/ground-1.jpg");
  h_img = loadImage("pics/heart2.png");
  coin_img = loadImage("pics/coin.png");
}

void setup() {
  size(800, 500);
  preload();
  buttons = new ArrayList<>();   
  ground = new Ground();
  stone = new Stone(width+20);
  stone2 = new Stone(width+width/2+20);
  c1 = new Coin(width+20);
  c2 = new Coin(width+width/2+20);
  runner = new Runner();
  cloud = new Cloud();
  int index = 0;
  for(int i=0;i<width;i+=width/4)
  {
    buttons.add(new Button(i+40,height-70,100,60,label[index]));
    index+=1;
  }
}

void draw() {
  

  background(158, 245, 252);
  ground.show();

  if(start){
    play();
  }else if(gameOver){
    text("Game Over",width/2,height/2);
    text("click to restart",width/2-10,height/2+25);
  }
  for(int i=0;i<buttons.size();i++)
      buttons.get(i).show();
}

void play(){

  background(158, 245, 252);
  
  for(int i=0;i<runner.health;i++){
    image(h_img,i*50+10,10,30,30);
  }
  
  ground.show();
  ground.move();
  
  stone.show();
  stone.move();
  
  stone2.show();
  stone2.move();
  
  c1.show();
  c1.move();
  
  c2.show();
  c2.move();
  
  cloud.show();
  cloud.move();
  
  runner.show();
  runner.move();
  
  runner.hit(stone);
  runner.hit(stone2);
  
  runner.hitcoin(c1);
  runner.hitcoin(c2);
  
  if(runner.health==0){
    gameOver = true;
    start = false;
  }
  textSize(25);
  text("SCORE : "+runner.score,400,50);
  text("HIGH_SCORE : "+high_score,550,50);
  if(runner.score>high_score){
      high_score = runner.score;
  }
}

void keyPressed(){
  if(key==' ')
    runner.jump();
}
void restartGame()
{
  ground = new Ground();
  stone = new Stone(width+20);
  stone2 = new Stone(width+width/2+20);
  runner = new Runner();
  cloud = new Cloud();
  start = true;
  gameOver = false;
}

void mousePressed(){
  if(gameOver){
  restartGame();
}
  for(int i=0;i<buttons.size();i++)
  {
    if(buttons.get(i).isClicked())
    {
      if(buttons.get(i).text == "Start" && !start)
        start = true;
      else if(buttons.get(i).text == "Pause"){
        noLoop();   
      }
      else if(buttons.get(i).text == "Resume")
       loop();
      else if(buttons.get(i).text == "Restart")
        restartGame();
    }
  }
}
