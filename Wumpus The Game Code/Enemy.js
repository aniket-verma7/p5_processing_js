class Enemy
{
    constructor(enemyImage,name)
    {
        this.enemyImage = enemyImage;
        this.enemyImage.resize(300,350);
        this.x = 550;
        this.y = 200;
        this.name = name;
        this.stats = new Stats();
    }

    getStats(){return this.stats;}

    resetStats()
    {
        this.stats = new Stats();
    }

    showEnemy(dx)
    {
        image(this.enemyImage,this.x+dx,this.y-30);
        this.stats.showEnemyStats(this.x+dx,550);
    }

    getName(){
        return this.name;
    }

    hit(stats)
    {
        let h = stats.getHealth();
        let diff = random(0,1);
        if(h - diff > 0)h -= diff;
        else h = 0;
        stats.setHealth(h);
    }

    isGameOver(){
        return this.stats.isGameOver();
    }
}