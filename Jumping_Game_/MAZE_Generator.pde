class bsMaze
{
  int mx =10;
  int my = 10;
  int last;
  
  CellPos currcell;
  ArrayList<CellPos> cellstack;
  boolean[][] horwalls;
  boolean[][] verwalls;
  boolean[][] visited;
  boolean whiledraw;
  
  bsMaze(int mazex,int mazey)
  {
    this.mx=mazex;
    this.my=mazey;
    this.visited = new boolean[this.mx][this.my];
    this.cellstack = new ArrayList<CellPos>();
    this.verwalls = new boolean[this.mx][this.my + 1];
    this.horwalls = new boolean[this.mx + 1][this.my];
    this.currcell = new CellPos(1, 1);
    this.cellstack.add(this.currcell);
    this.domaze();
    this.cmaze();
    this.fillGrid();
  }
  
  private void domaze() 
  {
    //make empty grid
    for(int i = 0; i < this.mx; i++) 
    {
      for(int j = 0; j < this.my; j++) 
      {
        this.visited[i][j] = false;
        this.verwalls[i][j] = true;
        this.horwalls[i][j] = true;
        grid.add(new cell(i,j)); //here we have grid init
      }
    }

   //make frame
    for(int x = 0; x < this.mx; x++) 
    {
      this.visited[x][0] = true;
      this.verwalls[x][this.my] = true;
      this.visited[x][this.my - 1] = true;
    }
    for(int y = 0; y < this.my; y++) 
    {
      this.visited[0][y] = true;
      this.visited[this.mx - 1][y] = true;
      this.horwalls[this.mx][y] = true;
    }
    this.whiledraw = true;
  }
  
  private void cmaze()
  {
    while(this.whiledraw)
    {
      if(this.whiledraw & this.cellstack.size() > 0) 
      {
        ArrayList<CellPos> neighbours = this.unvisited_n(this.currcell);
       if(neighbours.size() > 0) 
       {
         this.cellstack.add(0, this.currcell);
         this.currcell = neighbours.get((int)random(neighbours.size()));
         this.visited[this.currcell.x][this.currcell.y] = true;
         CellPos old = this.cellstack.get(0);

         if(old.x == currcell.x) 
         {
           if (old.y > this.currcell.y) 
           {
             this.horwalls[old.x][old.y] = false;
           } 
           else 
           {
             this.horwalls[this.currcell.x][this.currcell.y] = false;
           }
         } 
         else 
         {
           if(old.x > this.currcell.x) 
           {
             this.verwalls[old.x][old.y] = false;
           } 
           else 
           {
              this.verwalls[this.currcell.x][this.currcell.y] = false;
           }
         }
       } 
       else 
       {
          this.currcell = this.cellstack.get(0);
          this.cellstack.remove(0);
       }
     } 
     else 
     {
        this.whiledraw = false;
     }  
   }
  }
  
  private ArrayList<CellPos> unvisited_n(CellPos cp) 
  {
    ArrayList<CellPos> u = new ArrayList<CellPos>();
    u.add(new CellPos(cp.x - 1, cp.y));
    u.add(new CellPos(cp.x, cp.y + 1));
    u.add(new CellPos(cp.x, cp.y - 1));
    u.add(new CellPos(cp.x + 1, cp.y));
    for(int i = u.size() - 1; i >= 0; i--) 
    {
      CellPos c = u.get(i);
      if (this.visited[c.x][c.y]) u.remove(i);
    }
    return u;
  }

  private void fillGrid()
  {
    for(int c = 0; c < grid.size(); c++)
    {
      cell buf1 = grid.get(c);
      if(this.horwalls[buf1.x][buf1.y]) 
      {
         buf1.top=false;
      }
      if(buf1.y<this.my-1)
      {
         if(this.horwalls[buf1.x][buf1.y+1]) 
        {
          buf1.bottom=false;
        }
      }
      else
      {
         buf1.bottom=false;
      }
      if(this.verwalls[buf1.x][buf1.y]) 
      {
        buf1.left=false;
      }
      if(buf1.x<this.mx-1)
      {
        if(this.verwalls[buf1.x+1][buf1.y]) 
        {  
          buf1.right=false;
        }
      }
      else
      {  
        buf1.right=false;
      }
      grid.set(c,buf1);
    }
    //get last cell, and remove border
    this.last=grid.size()-this.my-2;
    cell buf1 = grid.get(this.last);
    buf1.right=true;
    grid.set(this.last,buf1); 
  }
  
}



class CellPos 
{
  int x, y;
  CellPos(int x, int y) 
  {
    this.x = x;
    this.y = y;
  }
}
