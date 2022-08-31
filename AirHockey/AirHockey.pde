import javax.swing.JOptionPane;

PImage board;
int x;
int y;
int s = 2;
Ball ball;
PlayerBar bar1,bar2;
Player player1,player2;
color c1 = color(200,0,0);
color c2 = color(0,0,200);
boolean a,d,r,l;
int p1=0;
int p2=0;

void setup()
{
  size(320,600);
  board = loadImage("assets/board.jpeg");
  ball = new Ball(width/2,240,20,color(0));
  bar1 = new PlayerBar(width/2-35,459,70,10,c1);
  bar2 = new PlayerBar(width/2-35,12,70,10,c2);
  
  String name1 = JOptionPane.showInputDialog(null,"Player1 name : ");
  String name2 = JOptionPane.showInputDialog(null,"Player2 name : ");
  if(name1==null || name2==null)exit();
  
  player1 = new Player(name1,c1,40,515);
  player2 = new Player(name2,c2,220,515);
}

void draw()
{
  
  background(200);
  image(board,0,0);
  
  textSize(50);
  fill(0);
  text(":",150,530);
  
  bar1.show();
  bar2.show();
  
  ball.show();
  ball.score(1);
  ball.score(2);
  player1.showPlayer();
  player2.showPlayer();
    
  ball.rebound(bar1,1);
  ball.rebound(bar2,2);
  move();
  
  ball.update();
}

void move()
{
  if(a)bar1.moveLeft();
  if(l)bar2.moveLeft();
  
  if(d)bar1.moveRight();
  if(r)bar2.moveRight();
}



void keyPressed()
{
  if(key == 'a' || key == 'A'){
    a=true;
  }
  if(key == 'd' || key == 'D'){
   d=true;
  }
  
  if(keyCode == RIGHT){
   r=true;
  }
  if(keyCode == LEFT){
    l=true;
  }
}

void keyReleased()
{
  if(key == 'a' || key == 'A'){
    a=false;
  }
  if(key == 'd' || key == 'D'){
   d=false;
  }
  
  if(keyCode == RIGHT){
   r=false;
  }
  if(keyCode == LEFT){
    l=false;
  }
}

void mousePressed()
{
  println(mouseX,mouseY);
  noLoop();
}
