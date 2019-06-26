void setup() {
  noStroke();
  noSmooth();
 fullScreen();
 //load and scale images
 icedCoffeePic = loadImage( "Milk.png");
 icedCoffeePic.resize(width/20, 0);
 chipsPic = loadImage( "Chips.png");
 chipsPic.resize(width/20, 0);
 whalePic = loadImage( "Whale.png");
 whalePic.resize(width/10, 0);
 pumpkinPiePic = loadImage( "Pie.png");
 pumpkinPiePic.resize(width/20, 0);
 danielPic = loadImage ("Left.png");
 danielPic.resize(width/10, 0);
 player.size = width/10;
}

//declare images
PImage icedCoffeePic;
PImage chipsPic;
PImage whalePic;
PImage pumpkinPiePic;
PImage danielPic;
PImage startscreenPic;
PImage endscreenPic;

//variables
boolean startscreen = true;
boolean endscreen = false;
float speed = 1;

//create arraylists
ArrayList<IcedCoffee> coffees = new ArrayList<IcedCoffee>();
ArrayList<Chips> chips = new ArrayList<Chips>();
ArrayList<Whale> whales = new ArrayList<Whale>();
ArrayList<PumpkinPie> pies = new ArrayList<PumpkinPie>();

//the most important part - creating the Daniel
Daniel player = new Daniel();

void draw(){

  //what happens on the startscreen
  if (startscreen == true)
  {
    background(255, 0, 0);
    textAlign(CENTER);
    textSize(height/15);
    text("Click anywhere to start game", width/2, height/2);
  }
  //what happens on the endscreen
   else if (endscreen == true)
  {
    background(255, 0, 0);
    textAlign(CENTER);
    textSize(height/15);
    text("Click to start again", width/2, height/2);
    reset();
  }
  else
  //when the game is running
  {
    game(); //where the game is actually run
  }
}

void mouseClicked() // triggers for start and endscreen, ensure that the player clicks in the game window so keypresses work
{
  if (startscreen == true){
    startscreen = false;
  }
  if (endscreen == true)
  {
    endscreen = false;
  }
}

void keyPressed() // for player movement
{
  if (keyCode == LEFT)
  {
    player.moveLeft();
    danielPic = loadImage ("Left.png");
    danielPic.resize(width/10, 0);
  }
    if (keyCode == RIGHT)
  {
    player.moveRight();
    danielPic = loadImage ("Right.png");
    danielPic.resize(width/10, 0);
  }
}

void game()
{
  //setup background,display player and score
    player.ypos = 9*height/10 -(width/11); //this makes sure the player is in the right place, because global variables are declared before the size is set
    background(150, 150, 255);
    rect(0, 9*height/10, width, width);
    player.display();
    textAlign(LEFT);
    textSize(20);
    fill(0);
    text( "Score = "+ player.points + "", 5, 9* height/10 +20);
    fill(255);
    
  //coffee spawn and delete
  for (int i = 0; i < coffees.size() - 1; i++)
  {
    IcedCoffee current = coffees.get(i);
    current.display();
    if (current.check())
    {
      coffees.remove(i);
    }
  }
  
  if ( frameCount % 100 == 0) // a coffee is spawned every 100 frames
  {
    coffees.add(new IcedCoffee());
  }
  
  //chips spawn and delete
   for (int i = 0; i < chips.size() - 1; i++)
  {
    Chips current = chips.get(i);
    current.display();
    if (current.check())
    {
      chips.remove(i);
    }
  }
  
  if ( frameCount % 50 == 0) // a chip is spawned every 50 frames
  {
    chips.add(new Chips());
  }
 

   //whale spawn and delete
   for (int i = 0; i < whales.size() - 1; i++)
  {
    Whale current = whales.get(i);
    current.display();
    if (current.check())
    {
      whales.remove(i);
    }
  }
  
  if ( frameCount % 400 == 0) // a whale is spawned every 400 frames
  {
    whales.add(new Whale());
  }
  
     //pie spawn and delete
   for (int i = 0; i < pies.size() - 1; i++)
  {
    PumpkinPie current = pies.get(i);
    current.display();
    if (current.check())
    {
      pies.remove(i);
    }
  }
  
  if ( frameCount % 500 == 0) // a pie is spawned every 500 frames
  {
    pies.add(new PumpkinPie());
  }
  
  //speed up, this makes the game get more difficult
  if (frameCount % 50 == 0)
  {
    speed = speed + 0.1;
  }
  if ( player.points < 0)
  {
    endscreen = true;
  }
}

void reset()
{
  //reset points
  player.points = 0;
  
  //delete coffees
  for (int i = coffees.size() - 1; i >= 0; i--) {
    coffees.remove(i);
  }
    //delete chips
  for (int i = chips.size() - 1; i >= 0; i--) {
    chips.remove(i);
  }
    //delete pies
  for (int i = pies.size() - 1; i >= 0; i--) {
    pies.remove(i);
  }
    //delete whales
  for (int i = whales.size() - 1; i >= 0; i--) {
    whales.remove(i);
  }
  
  // reset speed
  speed = 1;
  
}
