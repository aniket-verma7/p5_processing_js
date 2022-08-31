class Particle {
  float x,y,dx,dy,alpha,d;
  
  Particle() {
    this.x = random(0, width);
    this.y = height;
    this.dx = random(-1, 1);
    this.dy = random(-5, -1);
    this.alpha = 255;
    this.d = 16;
  }

  boolean finished() {
    return alpha < 0;
  }

  void update() {   
    this.x += this.dx;
    this.y += this.dy;
    this.alpha -= 15;
    this.d -= random(0.05, 0.1);
  }

  void show() {
    noStroke();
    fill(242,2,7, this.alpha);
    rect(this.x, this.y, this.d,this.d);
    fill(0,250,100, this.alpha/3);
    ellipse(this.x, this.y, this.d,this.d);
  }
}
