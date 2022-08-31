int size = 100;
Point[] point = new Point[size];

void setup()
{
  size(600,600);
  
  for(int i=0;i<size;i++)
  {
    point[i] = new Point();
  }
}

void draw()
{
    loadPixels();
  for (int i = 0; i < width; i++) 
  {
    for (int j = 0; j < height; j++) 
    {
      int pixel = i+j*width;
      color c = color(red(pixels[pixel])-15,green(pixels[pixel])-15,blue(pixels[pixel])-15);
      
      pixels[pixel] = c;
      
      if(i>1&&i<width-1&&j>1&&j<height-1)
      {
        float r = red(pixels[(i)+(j-1)*width])+red(pixels[(i)+(j+1)*width])+red(pixels[(i-1)+(j)*width])+red(pixels[(i+1)+(j)*width]);
              //r+= green(pixels[(i-1)+(j-1)*width])+red(pixels[(i+1)+(j+1)*width])+red(pixels[(i+1)+(j-1)*width])+red(pixels[(i+1)+(j-1)*width]);
              
        float g = green(pixels[(i)+(j-1)*width])+green(pixels[(i)+(j+1)*width])+green(pixels[(i-1)+(j)*width])+green(pixels[(i+1)+(j)*width]);
              //g+= blue(pixels[(i-1)+(j-1)*width])+red(pixels[(i+1)+(j+1)*width])+red(pixels[(i+1)+(j-1)*width])+red(pixels[(i+1)+(j-1)*width]);
              
        float b = blue(pixels[(i)+(j-1)*width])+blue(pixels[(i)+(j+1)*width])+blue(pixels[(i-1)+(j)*width])+blue(pixels[(i+1)+(j)*width]);
              //b+= red(pixels[(i-1)+(j-1)*width])+red(pixels[(i+1)+(j+1)*width])+red(pixels[(i+1)+(j-1)*width])+red(pixels[(i+1)+(j-1)*width]);
        
        pixels[pixel] = color(r/4.05,g/4.05,b/4.05);   
      }
    }
  }
  
  for(int n=0;n<point.length;n++)
  {
    point[n].update();
    
    for (int i = int(point[n].x)-5; i < point[n].x+5; i++) 
    {
      for (int j = int(point[n].y)-5; j < point[n].y+5; j++) 
      {
        int loc = int(i+width*j);
        color c = color(255);
        if(loc>0&&loc<pixels.length)
          pixels[loc] = c;
      }
    }
  }
  updatePixels();
  
}
