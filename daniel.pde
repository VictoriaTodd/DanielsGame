class Daniel
{
  int size;
  int points;
  float xpos, ypos;
  
  Daniel(){
    size = width/10;
    points = 0;
    xpos = 400;
    ypos =height;// this basically makes no difference as it is reset in the game() function
  }
  
void  display() // draws the player
  {
    image(danielPic, xpos, ypos);
  }
  
  void moveLeft() //handles movement when called by keyPressed()
  {
    if( xpos > 0){
      xpos = xpos - 10;
    }
    else
    {
      xpos = width;
    }
  }
  
  void moveRight() //handles movement when called by keyPressed()
  {
    if ( xpos < width - size){
      xpos = xpos + 10;
    }
    else
    {
      xpos = 0;
    }
  }
}