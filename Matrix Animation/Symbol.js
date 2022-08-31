class CustomSymbol
{
  /**
   * x : x postion of the symbol on canvas
   * y : y postion of the symbol on canvas
   * speed : rate of change for y 
   * opacity : visibility for each symbol on the canvas
   * size : size of each character.
   */
  constructor(x, y, speed, opacity,size)
  {
    this.x = x;
    this.y = y;
    this.value;
    this.speed = speed;
    this.opacity = opacity;
    this.size = size;
    this.switchInterval = round(random(0, 15));//rate of change of single symbol to differnet symbol
    this.setToRandomSymbol();//assign this.value with a random katana character.
  }
  
  /**
   * changing the this.value according to the frameCount and switchInterval
   * this method is called everytime when an symbol is shown on screen.
   */
  setToRandomSymbol()
  {
    if (frameCount % this.switchInterval == 0) 
      this.value = String.fromCharCode(0x30A0 + floor(random(0, 97)));
  }
  
  /**
   * amp : current amplitude level of the sound been played in the background
   * mapping amp value from 0-1 to 0-5 and mulitiply that value with rgb values and 
   * text size so that text can react as music/song progresses.
   */
  show(amp)
  { 
      amp = map(amp,0,1,0,5);
      fill(255*amp,0,20*amp,255*amp);
      textSize(this.size*amp);
      text(this.value,this.x,this.y);

      if(this.y>=height)this.y=0;
      else this.y += (this.speed);

      this.setToRandomSymbol();//changing to different katana symbol everytime show is called.
  }
  
}