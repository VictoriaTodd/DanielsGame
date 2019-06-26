class Whale{
  int size;
  float xpos, ypos;
  int points;
 
  Whale() // constructor
  {
    size = width/10;
    xpos = int(random( 0, width));//starting position is at the top of the screen, randomly distributed on x axis
    ypos = 0;
    points = -50 * int(speed); // the whales get more dangerous as the game goes on
  }
  
  void display() //movement and display
  {
    image(whalePic, xpos, ypos);
    ypos += speed;
  }
  
  Boolean check() // collision checks and point increment, returns 1 to delete
  {
    if (ypos > 9*height/10 - (width/10))
    {
      return true;
    }
    //if ((ypos < 9*height/10 - (width/10))&&(ypos > 9*height/10-(width/20 + width/20)))
    if (ypos > 9*height/10 - 2*width/10)
    {
      if ( (xpos - (width/10) <= player.xpos) && ( player.xpos <= xpos + (width/10)) )
      {
  
        player.points = player.points + points;
        return true;
      }
    }
    return false;
  }
}
