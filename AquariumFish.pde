class AquariumFish
{
  float xPos, yPos;
  float speed;
  
  public AquariumFish()
  {
    xPos = random(width);
    yPos = random(200,height);
    while( speed < 0.5 && speed > -0.5) //keeps the speed from
      speed = random(-2,2);             //being too slow
    
  }
  
  public void moveAndDraw( int i )
  {
    image(fishPic[i/3],xPos,yPos);
    xPos+=speed;
    
    if( xPos > width+fishPic[i/3].width  ||  xPos < -fishPic[i/3].width )
    {
      yPos = random(200,height);
      speed = 0;
      while( speed < 0.5 && speed > -0.5)
        speed = random(-2,2);
      if( speed > 0 )
        xPos = -fishPic[i/3].width;
      else
        xPos = width+fishPic[i/3].width;
    }
  }
}
