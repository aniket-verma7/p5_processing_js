class Circle{
    constructor(x,y,radius){
        this.x = x;
        this.y = y;
        this.radius = radius;
    }

    drawCircle(){
        this.r = this.radius;
        for(let c=1;c<=7;c++)
        {
            if(c%2==0)fill(200,0,0,80);
            else fill(0,200,0,80);
            if(this.r>0)
                ellipse(this.x,this.y,this.r,this.r);  
            this.r-=10;
        }
    }

    setRadius(newRadius){
        this.radius = newRadius;
    }

    resetRadius(){
        this.radius = 100;
    }
}