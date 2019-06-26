class Chips{
  int points;
  int size;
  float xpos, ypos;
 
    Chips() // default constuctor
  {
    size = width/20;
    xpos = int(random( 0, width));//starting position is at the top of the screen, randomly distributed on x axis
    ypos = 0;
    points = 5;
  }
  
    void display() // draws the chip, also handles movement
  {
    image(chipsPic, xpos, ypos);
    ypos += speed;
  }
  
    Boolean check() // check if the chips have reached the bottom of the frame or collided with the player
  {
    if (ypos > 9*height/10 - (width/20))
    {
      return true;
    }
    if ((ypos < 9*height/10 - (width/20))&&(ypos > 9*height/10-(width/10 + width/ 20)))
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
