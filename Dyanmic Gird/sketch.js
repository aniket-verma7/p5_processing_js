let row,col;
let figureToDraw = true;
let prevSec = 0;
let figure1 = [];
let figure2 = [];

function setup() {
  createCanvas(600, 600);
  row = width/10;
  col = height/10;
  init();
}

function init(){
  for(let i = row;i<width;i+=row)
    for(let j=col;j<height;j+=col)
    {
      figure1.push(new Circle(i,j,100));
      figure2.push(new Square(i,j,70));
    }
}

function draw() {
  background(160);
  
  if(int(millis()/1000) == int(prevSec+1)){
    prevSec = int(millis()/1000);
    if(figureToDraw)figureToDraw = false;
    else figureToDraw = true;
  }

  for(let i = 0 ; i < figure1.length;i++){
      if(figureToDraw)figure1[i].drawCircle();
      else figure2[i].drawSquare(row,col);                
    }
}

function mouseMoved(){
  if(mouseX>=0 && mouseX<=width && mouseY>=0 && mouseY<=height)
  {
    for(let i = 0 ; i < figure1.length;i++){
      let distance = dist(mouseX,mouseY,figure1[i].x,figure1[i].y);
      figure1[i].radius = distance*0.5;
      figure2[i].sides = distance*0.5;
    }
  }
  else{
    for(let i = 0 ; i < figure1.length;i++){
      figure1[i].resetRadius();
      figure2[i].resetSides();
    }
  }
}