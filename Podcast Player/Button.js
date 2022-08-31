class Button{
    constructor(x,y,w,h,txt){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.txt = txt;
    }

    show(){
        push();
       
        noStroke();
        fill(255);
        let len = this.txt.length;
        let extraW = this.w*.05
        let extraH = this.h*.1
        rect(this.x,this.y,this.w+extraW,this.h+extraH,20);
        fill(255,0,0);
        rect(this.x,this.y,this.w,this.h,20);
        textSize(width*.02);
        fill(255)
        text(this.txt,this.x,this.y);
        pop();
    }

    clicked(){
        return (mouseX >= this.x-this.w && mouseX<=this.x+this.w && mouseY >=this.y-this.h && mouseY<=this.y+this.h);
    }
}