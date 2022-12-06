class MAZE
{
  MAZE()
  {
    CELLSIZE = height / (ms * 1.0);
    WALLSIZE = CELLSIZE / 5.0;
    MAZE_X = (int)(width / CELLSIZE);
    MAZE_Y = (int)(height / CELLSIZE);
    grid = new ArrayList<cell>();
  
    maze = new bsMaze(MAZE_X,MAZE_Y);
    player = new player(1,1);
  }
  
  void display()
   {
    background(0);
    stroke(255,30,200);
    fill(255);
    translate(-WALLSIZE/2,-WALLSIZE/2);
    for(int c = 0; c < grid.size(); c++)
    {
      cell buf1 = grid.get(c);
      buf1.drawMe();
    }  
    player.drawMe();
   }
  
}
