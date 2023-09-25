//Aquarium example
//Fish should face the direction they are moving

int fishCount = 6;

PImage fishPic[] = new PImage[fishCount];
PImage lock;

boolean unlocked[] = {true,false,true,false,true,false};

AquariumFish fish[] = new AquariumFish[fishCount*3];

void setup()
{
  size(700,700);
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  
  //load fish images and resize
  fishPic[0] = loadImage("1.png");
  fishPic[1] = loadImage("2.png");
  fishPic[2] = loadImage("3.png");
  fishPic[3] = loadImage("4.png");
  fishPic[4] = loadImage("5.png");
  fishPic[5] = loadImage("6.png");
  for(PImage p: fishPic)
  {
    if(p.width > p.height)
      p.resize(90,0);
    else
      p.resize(0,90);
  }
  
  for(int i = 0; i < fish.length; i++)
    fish[i] = new AquariumFish();
  
  lock = loadImage("lock.png");
  lock.resize(30,0);
}

void draw()
{
  background(100,225,255);
  
  //Draw unlock symbols
  for(int i = 0; i < 6; i++)
  {
    if(unlocked[i])
    {
      drawSwimmingFish(i);
    }
    else
    {
      drawLockedFish(i);
    }
  }
}

void drawSwimmingFish(int i)
{
  for(int j = i*3; j < i*3+3; j++)
    fish[j].moveAndDraw(j);
}

void drawLockedFish(int i)
{
  fill(0,127);
  rect(100+i*100,100,90,90,30);
  tint(0,127);
  image(fishPic[i],100+i*100,100);
  tint(255);
  image(lock,100+i*100,100);
}

void mousePressed() //FOR TESTING
{
  for(int i = 0; i < 6; i++)
  {
    if( dist(mouseX, mouseY, 100+i*100, 100 ) < 50 )
      unlocked[i] = !unlocked[i];
  }
}
