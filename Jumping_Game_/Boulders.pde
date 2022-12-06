class Boulder extends Sprite
{
  Boulder(float xreg, float yreg, float bx, float by)
  {
    super(xreg,yreg,bx,by);
    this.velocity.x = -8;
    this.location.y = (height/2 - boxy) - 50;
  }
  
  void check()
  {
    if(this.location.x <= -boxx-(width/1.5))
    {
      this.currentAni = floor(random(0,this.nAni));
      this.boxx = this.ani[currentAni].frames[0].width;
      this.boxy = this.ani[currentAni].frames[0].height;
      this.ani[currentAni].w=this.boxx;
      this.ani[currentAni].h=this.boxy;
      this.reg.x = boxx/2.0;
      this.reg.y = boxy/2.0;
      this.location.x = (width/2.0)+random(3000);
    }
    if(collision(this, s)) 
    {
      //beep.play();
      reset();
      gameState = 2;
    }
  }
}
