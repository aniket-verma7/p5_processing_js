let back; 
let message = "Wumpus The Game";
let b1,b2,b3;
let wumpus;
let shiftX = 0,shiftY = 0;
let finalShiftX = 200;
let finalShiftY = 550;
let start = false;
let showStats = false;
let showOutfit = false;
let fight = false;
let level = 0;
let outfitIndex = -1;
let enemyIndex = -1;
let wumpusChance = false;
let regen = false;
let showSettings = false;
let feed = false;
let enemyChance = false;
let showCredits = false;
let stats;
let outFit;
let rate = 60;
let dx = 200;
let menuText1 = ["Start","Settings","Credits"];
let menuText2 = ["Outfit","Feed","Attack"];
let menuText3 = ["Fight","Sleep","Run"];
let backgroundColorList = ['#7171FC','#F171FC','#71C1FC','#6CF496'];
let menuText4 = "Try Again";

let enemyList = [];

function preload()
{
    e1 = loadImage('assets/e1.png');
}

function setup() 
{
    createCanvas(900, 900);
    back = backgroundColorList[0];

    stats = new Stats();
    wumpus = new Wumpus(stats);
    outFit = new Outfit();

    b1 = new Button(128,820);
    b1.setText(menuText1[0]);

    b2 = new Button(351, 820);
    b2.setText(menuText1[1]);

    b3 = new Button(575, 820);
    b3.setText(menuText1[2]);

    enemyList.push(new Enemy(e1,"Bent"));
}

function draw() 
{
    frameRate(rate);
    textFont("Lato");
    background(back);
    
    wumpus.showWumpus(shiftX);
    if(!fight && level === 3) 
    {
        wumpus.showMouth();
        wumpus.wumpusDie(265,30);
        wumpus.wumpusDie(470,30);
        gameOverText();
    }
    if(feed)wumpus.showMouth();
    if(!start)welcomeMessage();
    if(showStats)stats.showStats(0,shiftY);
    if(showCredits)credits();
    if(showSettings)settings();
   showOutFit();

    b1.showButton();
    b2.showButton();
    b3.showButton();

    if(level === 2)wumpusOption();
    if(enemyIndex !=-1)enemyList[enemyIndex].showEnemy(dx);
    

    if(fight && stats.isGameOver())     //wumpus lost here
    {
        enemyList[enemyIndex].resetStats();
        enemyIndex = -1;
        level += 1;
        fight = false;
        shiftX = 0;
        shiftY = 0;
        b1.setText(menuText4);
        b2.setText(menuText4);
        b3.setText(menuText4);
    }
    else if(fight && enemyIndex != -1 && enemyList[enemyIndex].isGameOver())reset();        //won condition

    if(fight)
    {
        if(enemyChance)enemyList[enemyIndex].hit(stats);
        if(wumpusChance)wumpus.hit(enemyList[enemyIndex].getStats());
        if(regen)wumpus.regenerate(); 
    }
    
    if(level == 2)
    {
        shiftX+=2;  
        dx-=2;
        shiftY+=5;
        if(shiftY>=550)shiftY=finalShiftY;
        if(shiftX>=finalShiftX)shiftX = finalShiftX;
        if(dx<=10)dx = 10;
    }
        
}

function mousePressed()
{   
    if(b1.isClicked(mouseX,mouseY) && level === 0)
    {
        start = true;
        b1.setText(menuText2[0]);
        b2.setText(menuText2[1]);
        b3.setText(menuText2[2]);
        showStats = true;
        showSettings = false;
        level += 1;
    }
    else if(b2.isClicked(mouseX,mouseY) && level === 0)
    {
        showSettings = !showSettings;
    }
    else if(b3.isClicked(mouseX,mouseY) && level === 0)
    {
        showCredits = !showCredits;
    }
    else if(b1.isClicked(mouseX,mouseY) && level === 1)
    {
        showOutfit = true;
        outfitIndex += 1;
        if(outfitIndex === 5)outfitIndex = 0;
    }
    else if(b2.isClicked(mouseX,mouseY) && level === 1)
    {
       feed = true;
    }
    else if(level == 1 && feed && wumpus.isFeeding(mouseX,mouseY))
    {
        feed = false;
        wumpus.increaseHunger();
    }
    else if(b2.isClicked(mouseX,mouseY) && level === 2)
    {
        wumpusChance = false;
        regen = true;
    }
    else if(b3.isClicked(mouseX,mouseY) && level === 1)
    {
        rate = 60;
        b1.setText(menuText3[0]);
        b2.setText(menuText3[1]);
        b3.setText(menuText3[2]);
        level+=1;
        enemyIndex = random(0,enemyList.length - 1);
    }
    else if(b1.isClicked(mouseX,mouseY) && level === 2)
    {
        if(!fight)
        {
            rate = 3;
            enemyChance = true;
            fight = true;
        }
        else if(fight)
        {
            wumpusChance = true;
            regen = false;
        }
    }
    else if(level == 3 || (b3.isClicked(mouseX,mouseY) && level === 2))
    {
        resetToStart();
    }
    else if(level == 0)
    {
        changeBackground();
    }
}

function changeBackground()
{
    if(mouseX>=b3.x-50 && mouseX<=b3.x+150 && mouseY>=b3.y-320 && mouseY<=b3.y-120)
       back = backgroundColorList[0];
    else if(mouseX>=b3.x+100 && mouseX<=b3.x+300 && mouseY>=b3.y-320 && mouseY<=b3.y-120)
        back = backgroundColorList[1];   
    else if(mouseX>=b3.x-50 && mouseX<=b3.x+150  && mouseY>=b3.y-200 && mouseY<=b3.y)
        back = backgroundColorList[2];   
    else if(mouseX>=b3.x+100 && mouseX<=b3.x+300 && mouseY>=b3.y-200 && mouseY<=b3.y)
        back = backgroundColorList[3];
}

function showOutFit()
{
    if(showOutfit)
    {
        if(outfitIndex === 0)
            outFit.outfit1(shiftX);    
        else if(outfitIndex === 1)
            outFit.outfit2(shiftX);
        else if(outfitIndex === 2)
            outFit.outfit3(shiftX);
        else if(outfitIndex === 3)
            outFit.outfit4(shiftX);
        else if(outfitIndex === 4)
            wumpus.showWumpus(shiftX);
    }
}
function welcomeMessage()
{
    push();
    fill('white')
    textSize(65);
    x = getTextX(message);
    text(message, x, 109);
    pop();
}

function getTextX(txt)
{
    let w = textWidth(txt);
    return (width-w)/2;
}

function wumpusOption()
{
    push();
    fill('white')
    textSize(45);
    text('What will Wumpus do?', 20, 770);

    textSize(60);
    if(outfitIndex === 0 || outfitIndex === 3)fill(0);
    else fill(255);
  
    let s = "Wumpus vs "+enemyList[enemyIndex].getName();
    let x = getTextX(s);
    text(s,x,80);
    pop();
}

function reset()
{
    start = true;
    enemyList[enemyIndex].resetStats();
    enemyIndex = -1;
    b1.setText(menuText2[0]);
    b2.setText(menuText2[1]);
    b3.setText(menuText2[2]);
    showStats = true;
    level = 1;
    shiftX = 0;
    shiftY = 0;
    showOutfit = false;
    showSettings = false;
    fight = false;
    outfitIndex = -1;
    dx = 200;
    wumpusChance = false;
    regen = false;
    showCredits = false
    feed = false;
    enemyChance = false;

    stats = new Stats();1
    wumpus = new Wumpus(stats);1
    outFit = new Outfit();1
}1
1
function resetToStart()
{
    b1.setText(menuText1[0]);
    b2.setText(menuText1[1]);
    b3.setText(menuText1[2]);
    shiftX = 0;
    shiftY = 0;
    start = false;
    showSettings = false;
    showStats = false;
    showOutfit = false;
    fight = false;
    level = 0;
    outfitIndex = -1;
    dx = 200;
    enemyIndex = -1;
    wumpusChance = false;
    regen = false;
    feed = false;
    showCredits = false
    enemyChance = false;

    stats = new Stats();
    wumpus = new Wumpus(stats);
    outFit = new Outfit();
}

function gameOverText()
{
    push();
    fill(255);
    textSize(100);
    text("Game Over",(width-textWidth('Game Over'))/2,700);
    pop();
}

function credits()
{
    push();
    fill(255);
    textSize(40);
    text("Created By :",b3.x,b3.y-100);
    text("Bent Van Aeken",b3.x,b3.y-50);
    pop();
}

function settings()
{
    push();
    fill(255);
    textSize(40);
    text("Settings :",b3.x,b3.y-300);   
    
    stroke(255);
    strokeWeight(5);
    fill(backgroundColorList[0]);
    circle(b3.x+50,b3.y-220,100);

    fill(backgroundColorList[1]);
    circle(b3.x+200,b3.y-220,100);

    fill(backgroundColorList[2]);
    circle(b3.x+50,b3.y-100,100);

    fill(backgroundColorList[3]);
    circle(b3.x+200,b3.y-100,100);
    pop();
}