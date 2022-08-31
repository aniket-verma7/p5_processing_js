class MatrixRain
{
  /**
   * totalSymbols : size of the indiviual stream or martix line
   * speed : rate of change for y coordinate
   * size : size of the text
   * symbols : array of all the individual symbol in single matrix pattern
   */
  constructor(size)
  {
    this.symbols = [];
    this.totalSymbols = round(random(5, 35));
    this.speed = random(5,10);
    this.size = size;
  }
  
  /**
   * initailizing our single matrix with katana symbol with CustomSymbol class
   * and adding that object to symbols array.
   */
  symbolsStream(x)
  {
    let opacity = 255;
    let y = random(-1000, 100);
    for (let i =0; i <= this.totalSymbols; i++) 
    {
      let symbol = new CustomSymbol(x,y,this.speed,opacity,this.size);
      this.symbols.push(symbol);
      opacity -= (255 / this.totalSymbols);
      y -= this.size;
    }
  }
  
  /**
   * amp : current amplitude level of the sound been played in the background
   * loop through the symbols array and calling CustomSymbol show(amplitude level) method for display the 
   * individual symbol on the canvas
   */
  rainStream(amp)
  {
    for(let i=0;i<this.symbols.length;i++)
    {
      let s = this.symbols[i]; 
      s.show(amp);
    }
  }
}