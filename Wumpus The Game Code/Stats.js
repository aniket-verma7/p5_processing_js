class Stats
{
    constructor()
    {
        this.health = random(2,10);
        this.hunger = random(2,10);
        this.MAX = 10;

        this.hungerX = 20;
        this.hungerY = 40;

        this.healthX = 20;
        this.healthY = 110;

        this.x1 = 20;
        this.y1 = 50;
        this.x2 = 20;
        this.y2 = 120;
    }

    getHealth(){return this.health;}
    getHunger(){return this.hunger;}
    setHealth(health){this.health = health;}
    setHunger(hunger)
    {
        this.hunger = hunger;
        if(this.hunger > this.MAX)this.hunger = this.MAX;
    }

    showStats(shiftX,shiftY)
    {

        let hungerBar = map(this.hunger,0,this.MAX,0,200);
        let healthBar = map(this.health,0,this.MAX,0,200);

        push();
        textFont("Lato");
        textSize(30);
        fill(255);
        text('Hunger',this.hungerX+shiftX,this.hungerY+shiftY);
        text('Health',this.healthX+shiftX,this.healthY+shiftY);

        noStroke();
        fill(255);
        rect(this.x1+shiftX,this.y1+shiftY,200,30,20);
        
        fill(255);
        rect(this.x2+shiftX,this.y2+shiftY,200,30,20);

        if(this.health !=0)
        {
            fill(0,255,0);
            rect(this.x1+shiftX,this.y1+shiftY,hungerBar,30,20);
            fill(255,0,0);
            rect(this.x2+shiftX,this.y2+shiftY,healthBar,30,20);
        }
        

        pop();
    }

    showEnemyStats(shiftX,shiftY)
    {

        let hungerBar = map(this.hunger,0,this.MAX,0,200);
        let healthBar = map(this.health,0,this.MAX,0,200);

        push();
        textFont("Lato");
        textSize(30);
        fill(255);
        let w1 = textWidth('Hunger');
        let w2 = textWidth('Health');

        text('Hunger',this.hungerX+shiftX + (200-w1),this.hungerY+shiftY);
        text('Health',this.healthX+shiftX + (200-w2),this.healthY+shiftY);

        noStroke();
        fill(255);
        rect(this.x1+shiftX,this.y1+shiftY,200,30,20);
        
        fill(0,255,0);
        rect(this.x2+shiftX + (200 - hungerBar),this.y1+shiftY,hungerBar,30,20);
        
        fill(255);
        rect(this.x2+shiftX,this.y2+shiftY,200,30,20);
        fill(255,0,0);
        rect(this.x2+shiftX + (200 - healthBar),this.y2+shiftY,healthBar,30,20);
        pop();
    }

    isGameOver()
    {
        return this.health ==0 ;
    }
}