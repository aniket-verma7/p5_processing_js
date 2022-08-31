class Particle{
    constructor(x,y){
        this.x = x;
        this.y = y;
        this.speedX = random(-2,2);
        this.speedY = random(-2,2);
    }

    show(){
        fill(255);
        circle(this.x,this.y,2);
    }

    update()
    {
        if(this.x>width || this.x<0)this.speedX *= (-1)
        if(this.y>height || this.y<0)this.speedY *= (-1)
        this.x+=this.speedX
        this.y+=this.speedY
    }
}