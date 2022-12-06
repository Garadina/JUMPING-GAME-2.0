import processing.sound.*;

SoundFile beep;

float angle = 0;

int gameState = 0; //0 = startscreen, 1 = play, 2 = dead

int count = 0;
Zombie s;
Ground[] g;
int nGround = 0;
Boulder[] b;
int nBoulder = 4;

  //Maze settings ----------------------------------------------
int ms = 15; //number of cells by the height of the app
int MAZE_X, MAZE_Y; //width and height of the mase in cells
float CELLSIZE;     //side of a cell (square)
float WALLSIZE;     //wall stroke
bsMaze maze;
MAZE mazegame;


//Game globals - nothing to change
ArrayList<cell> grid = new ArrayList<cell>();
player player;



void setup()
{
  size(1200,600);
  //fullScreen();
  //beep = new SoundFile(this,"beep.wav");
  reset();
}

void draw()
{
  if(gameState == 0) startScreen();
  if(gameState == 1) game(); 
  if(gameState == 2) mazegame();
}

void mazegame()
{
  mazegame.display();
}

void reset()
{
  
  mazegame = new MAZE();
  s = new Zombie(50,15,120,200);
  String[] files = {"Bug.svg","Bug2.svg"};
  s.addAnimation(new Animation(files));
  String[] files1 = {"Bug3.svg","Bug4.svg"};
  s.addAnimation(new Animation(files1));
  String[] files2 = {"BugJump.svg","BugJump2.svg"};
  s.addAnimation(new Animation(files2));
  String[] files3 = {"BugFall1.svg","BugFall2.svg"};
  s.addAnimation(new Animation(files3));
  s.currentAni=0;
  
  nGround = ceil(width/800.0)+1;
  println(width/800.0);
  
  String[] files4 = {"Ground.svg"};
  String[] files5 = {"Ground2.svg"};
  String[] files6 = {"ground3.svg"};
  String[] files7 = {"Ground4.svg"};
  String[] files8 = {"Ground5.svg"};
  String[] files9 = {"Ground6.svg"};
  g = new Ground[nGround];
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i] = new Ground(0,0,800,600);
    g[i].location.x = (-width/2.0)+(i*800);
    g[i].addAnimation(new Animation(files4));
    g[i].addAnimation(new Animation(files5));
    g[i].addAnimation(new Animation(files6));
    g[i].addAnimation(new Animation(files7));
    g[i].addAnimation(new Animation(files8));
    g[i].addAnimation(new Animation(files9));
    
  }
  String[] files11 = {"boulder1.svg"};
  String[] files12 = {"Boulder2.svg"};
  String[] files13 = {"Boulder3.svg"};
  String[] files14 = {"Boulder4.svg"};

  b = new Boulder[nBoulder];
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i] = new Boulder(0,0,100,100);
    //b[i].addAnimation(new Animation(files10));
    b[i].addAnimation(new Animation(files11));
    b[i].addAnimation(new Animation(files12));
    b[i].addAnimation(new Animation(files13));
    b[i].addAnimation(new Animation(files14));
  }  
}

//end screen
void endScreen()
{
  noStroke();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("OOPS! NOW YOU HAVE TO ESCAPE TO PLAY AGAIN.",width/2,height/2);
}

//startscreen
void startScreen()
{
  noStroke();
  fill(color(55,200,100));
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Press any key to start",width/2,height/2);
}



//game state
void game()
{
  background(100,10,100);
  translate(width/2,height/2);
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i].update();
    g[i].check();
    g[i].display();
  }

  s.update();
  s.check();
  s.display();
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i].update();
    b[i].check();
    b[i].display();
  }  
}

void keyPressed()
{
  if(gameState == 0) gameState = 1;
  if(gameState == 1) s.jump();
  
  if(gameState == 2)
  {
    if(keyCode==UP)    player.moveMe("up");
    if(keyCode==DOWN)  player.moveMe("down");
    if(keyCode==LEFT)  player.moveMe("left");
    if(keyCode==RIGHT) player.moveMe("right");
  }
  
  if(gameState == 3) 
  {
    reset();
    gameState = 1;
  } 
}

boolean collision(Sprite s1, Sprite s2)
{
  PVector loc1 = new PVector(s1.location.x,s1.location.y);
  PVector loc2 = new PVector(s2.location.x,s2.location.y);
  PVector d = loc1.sub(loc2);
  float dist = d.mag();
  float limit = (min(s1.boxx,s1.boxy)/2)+(min(s2.boxx,s2.boxy)/2);
  if(dist < limit) return(true);
  return(false);
}
