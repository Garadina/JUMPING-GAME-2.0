class player
{
  int x =1;
  int y =1;
  
  player(int sx, int sy)
  {
    this.x=sx;
    this.y=sy;
  }
  
  void drawMe()
  {
    noStroke();
    float d = CELLSIZE-WALLSIZE;  
    //rect((this.x*CELLSIZE)+WALLSIZE,(this.y*CELLSIZE)+WALLSIZE,d,d);
    fill(255,255,255);
    ellipse((this.x*CELLSIZE)+WALLSIZE+d/2,(this.y*CELLSIZE)+WALLSIZE+d/2,d-WALLSIZE*2,d-WALLSIZE*2);
  }
  
  void moveMe(String dir)
  {
    int cellnum = this.x*MAZE_Y+this.y;
    cell buf = grid.get(cellnum);
    //buf.test=true;
    //grid.set(cellnum,buf);
    int dx = 0;
    int dy = 0;
    switch(dir)
    {
      case "left" :  if(buf.left)   dx=-1; break;
      case "right" : if(buf.right)  dx= 1; break;
      case "up" :    if(buf.top)    dy=-1; break;
      case "down" :  if(buf.bottom) dy= 1; break;
    }
    this.x=this.x+dx;
    this.y=this.y+dy;
    
    if(this.x == MAZE_X - 1 && this.y == MAZE_Y - 2) {gameState = 0;  reset();}
    
    println(this.x);
    println(this.y);
    
    println(MAZE_X);
    println(MAZE_Y);
    
  }
}
