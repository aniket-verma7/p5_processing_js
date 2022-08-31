int row = 25;
int col = 25;

int sclX;
int sclY;

boolean run = false;
Cell [][]grid = new Cell[row][col];
Cell start,current,end;
ArrayList<Cell> openSet = new ArrayList<Cell>();
ArrayList<Cell> closedSet = new ArrayList<Cell>();
//ArrayList<Cell> path = new ArrayList<Cell>();

void setup()
{
  frameRate(100);
  size(800,800);
  sclX = width/row;
  sclY = height/col;
  
  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++)
      grid[i][j] = new Cell(i,j);

  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++)
      grid[i][j].addN(grid);
 
  start = grid[0][0];
  end = grid[row-1][col-1];
  
  openSet.add(start);
}

void draw()
{
  background(255);
  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++){
      grid[i][j].show(color(200));
      if(mousePressed && mouseX>=grid[i][j].i*sclX && mouseX<=grid[i][j].i*sclX+sclX && mouseY>=grid[i][j].j*sclY && mouseY<=grid[i][j].j*sclY+sclY)
          grid[i][j].clicked();
    }
  if(mousePressed && mouseX>=start.i && mouseX<=start.i+sclX && mouseY>=start.j && mouseY<=start.j+sclY)
  {
     run = true;  
  }
  if(run)
  {
    if(openSet.size() > 0)
    {
      int index = findMin();
      current = openSet.get(index);
      if(current == end)
      {
        println("Done");
        noLoop();
      }
      openSet.remove(current);
      closedSet.add(current);
      
      ArrayList<Cell> neb = current.neb;
      for(Cell tmp:neb)
      {
        if(!closedSet.contains(tmp) && !tmp.clicked)
        {
          int tmpG = current.g + abs(tmp.i - current.i) + abs(tmp.j - current.j);
          
          boolean newPath = false;
          if(openSet.contains(tmp))
          {
            if(tmpG < tmp.g)
            {
              tmp.g = tmpG;
              newPath = true;
            }
          }
          else
          {
            tmp.g = tmpG;
            newPath = true;
            openSet.add(tmp);
          }
          
          if(newPath)
          {
            tmp.h = abs(tmp.i - current.i) + abs(tmp.j - current.j);
            tmp.f = tmp.g + tmp.h;
            tmp.previous = current;
          }
        }
      }
      for (int i = 0; i < closedSet.size(); i++) {
      closedSet.get(i).show(color(100));
    }
  
    for (int i = 0; i < openSet.size(); i++) {
      openSet.get(i).show(color(200,200,0));
    }
    
    ArrayList<Cell> path = new ArrayList<Cell>();
    Cell temp = current;
    path.add(temp);
    /**
     *  back tracking the path form current node to the starting node.
     */
    while (temp.previous!=null) {
      path.add(temp.previous);
      temp = temp.previous;
    }
    for(Cell tmp:path)
        {
          tmp.show(color(255));
        }
    }
    else{
      background(255,0,0);
      println("NO SOLUTION...");
      noLoop();
    }
    
}
}

int findMin()
{
  int lower = 0;
  for(int i=0;i<openSet.size();i++)
    if(openSet.get(i).f < openSet.get(lower).f)
        lower = i;
  return lower;
}
