class Button 
{
    constructor(x,y) 
    {
        this.x = x; 
        this.y = y; 
        this.l = 200; 
        this.b = 50; 
        this.txtY = y+35;
    }

    setText(txt)
    {
        this.txt = txt;
        this.w = 1.5*textWidth(txt);
        this.txtX = this.x+(this.l)/2 - this.w;
    }

    showButton()
    {
        push();
        fill('white');
        noStroke();
        rect(this.x, this.y, this.l, this.b, 20);

        textSize(35);
        fill(0);
        text(this.txt, this.txtX, this.txtY);
        pop();
    }

    isClicked(currentX,currentY) 
    {
        return (currentX >= this.x && 
                currentX <= this.x + this.l &&
                currentY >= this.y && currentY<=this.y+this.b);
    }
}