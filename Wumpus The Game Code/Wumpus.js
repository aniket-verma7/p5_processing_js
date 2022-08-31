class Wumpus
{
    constructor(stats){
        this.stats = stats;
    }
    showWumpus(shiftX)
    {
        push();
        noStroke();
        let wumpusColor = color('#789EE7');
        let wumpusColorLight = color('#A5C9F3');
        let wumpusColorLip = color('#95BEED');
        let wumpusColorOgen = color('#0D0D0D');
        /* Wumpus */
        fill(wumpusColor);
        rect(267-shiftX, 211, 100, 123, 23); /* Oor links */
        rect(533-shiftX, 211, 100, 123, 23); /* Oor rechts */
        fill(wumpusColorLight);
        rect(281-shiftX, 226, 100, 92, 19); /* Oor links binnenkant*/
        rect(518-shiftX, 226, 100, 92, 19); /* Oor rechter binnenkant*/
        fill(wumpusColor);
        rect(360-shiftX, 166, 180, 800); /* Nek */
        rect(308-shiftX, 166, 284, 210, 43); /* Hoofd */
        fill(wumpusColorLip);
        rect(413-shiftX, 266, 75, 84, 15); /* Lip */
        fill(wumpusColorLight);
        rect(389-shiftX, 252, 123, 85, 29); /* Snuit */
        
        if(this.stats.getHealth() != 0)
        {
            fill(wumpusColorOgen);
            circle(349-shiftX, 273, 43); /* Linker oog */
            circle(550-shiftX, 273, 43); /* Rechter oog */
        }
        

        fill(wumpusColor);
        rect(408-shiftX, 308, 39, 18, 50); /* Snuit gat links*/
        rect(455-shiftX, 308, 39, 18, 50); /* Snuit gat rechts*/
        pop();
    }

    hit(stats)//enemy stats
    {
        let h = stats.getHealth();
        let diff = random(0,1);
        if(h - diff > 0)h -= diff;
        else h = 0;
        stats.setHealth(h);
    }

    showMouth()
    {
        let wumpusColorLip = color('#95BEED');
        let wumpusColorOpenMouth = color('#648AF0');
      
        noStroke(); 
        fill(wumpusColorLip);
        rect(413, 340, 75, 49, 0,0,25,25); /* Lip */
        fill(wumpusColorOpenMouth);
        rect(420, 340, 60, 42, 0,0,20,20); /* Lip Open */
    }

    isGameOver(){
        return stats.isGameOver();
    }

    regenerate()
    {
        let hunger = stats.getHunger();
        let health = stats.getHealth();
        let diff = random(1,2);
        if(hunger===0)return true;
        health += diff;
        hunger -= diff;
        if(hunger <=0)hunger = 0;
        stats.setHealth(health);
        stats.setHunger(hunger);
        return false;
    }

    isFeeding(currentX,currentY){
        return (currentX >= 420 && currentX<=480 && currentY >=340 && currentY<=382);
    }

    increaseHunger()
    {
        this.stats.setHunger(this.stats.getHunger()+1);
    }

    wumpusDie(x,y)
    {
      push();
      fill('#0D0D0D');
      translate(x,y);
      rotate(PI / 3.9);
      rect(200, 100, 68, 22);
      rect(222, 77, 22, 68);
      pop();
    }
}