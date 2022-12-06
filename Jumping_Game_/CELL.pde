class cell
{
  int x;
  int y;
  boolean top = true;
  boolean left = true;
  boolean right = true;
  boolean bottom = true;
  boolean test =  false;
  
  cell(int xx,int yy)
  {
    this.x=xx;
    this.y=yy;
  }
  
  boolean drawMe()
  {
    if(this.x==0) return(false);
    if(this.y==0) return(false);
    if(this.x==MAZE_X-1) return(false);
    if(this.y==MAZE_Y-1) return(false);
    
    float sx = this.x*CELLSIZE;
    float sy = this.y*CELLSIZE;
    float w = CELLSIZE+WALLSIZE;
    float h = CELLSIZE+WALLSIZE;
    float s = WALLSIZE;
    
    noStroke();
    if(this.test)
    {
      fill(color(10,200,30,150));
      rect(sx,sy,w,h);
    }  
    fill(color(50,200,0));
    if(!this.top)     rect(sx,sy,w,s);
    if(!this.left)    rect(sx,sy,s,w);
    if(!this.bottom)  rect(sx,sy+CELLSIZE,w,s);
    if(!this.right)   rect(sx+CELLSIZE,sy,s,w);
    return(true);
  }
}
