class IcedCoffee{
  int points;
  int size;
  float xpos, ypos;
 
  IcedCoffee()// constructor
  {
    size = width/20;
    xpos = int(random( 0, width));//starting position is at the top of the screen, randomly distributed on x axis
    ypos = 0;
    points = 10;
  }
  
  void display() // draws iced coffee and handles movement
  {
    image(icedCoffeePic, xpos, ypos);
    ypos += speed;
  }
  
  Boolean check() // check for collision and return 1 to delete 
  {
  if (ypos > 9*height/10 - (width/20))
    {
      return true;
    }
    if ((ypos < 9*height/10 - (width/20))&&(ypos > 9*height/10-(width/10 + width/20)))
    {
      if ( (xpos - (width/10) <= player.xpos) && ( player.xpos <= xpos + (width/20)) )
      {
        player.points = player.points + points;
        return true;
      }
    }
    return false;
  }
}

 
