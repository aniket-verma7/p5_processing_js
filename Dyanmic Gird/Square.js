class Square{
    constructor(x,y,sides){
        this.x = x;
        this.y = y;
        this.sides = sides;
    }

    drawSquare(row,col){
        this.shift = 0;
        this.s = this.sides;

        for(let c=1;c<=7;c++){
            
            this.bx = (this.x - row/2)+this.shift;
            this.by = (this.y - col/2)+this.shift;

            if(c%2==0)fill(200,0,0,80);
            else fill(0,200,0,80);

            rect(this.bx,this.by,this.s,this.s);
            this.shift+=5;
            this.s-=10;
        }
    }

    resetSides(){
        this.sides = 70;
    }
}