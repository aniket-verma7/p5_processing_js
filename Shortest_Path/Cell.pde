import java.util.*;
class Cell
{
  int i,j;
  int f,g,h;
  ArrayList<Cell> neb = new ArrayList<Cell>();
  boolean clicked = false;
  Cell previous = null;
  Cell(int i,int j)
  {
    this.i=i;
    this.j=j;
    this.f=0;
    this.g=0;
    this.h=0;
  }
  
  void show(color c)
  {
    fill(c);
    if(clicked)fill(0);
    
    if(i==0 && j==0)fill(0,200,0);
    if(i==row-1 && j==col-1)fill(200,0,0);
    rect(i*sclX,j*sclY,sclX,sclY);
  }
   
  void clicked()
  {
    this.clicked = true;
  }
    
   void addN(Cell[][] grid)
   {
      if (i < col - 1) {
          neb.add(grid[i + 1][j]);
      }
      if (i > 0) {
          neb.add(grid[i - 1][j]);
      }
      if (j < row - 1) {
          neb.add(grid[i][j + 1]);
      }
      if (j > 0) {
          neb.add(grid[i][j - 1]);
        }
   }
}
