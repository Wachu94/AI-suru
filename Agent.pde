class Agent
{
  int d = 30;
  PVector pos;
  PVector vel = new PVector(0,0);
  float rotation;
  boolean accelerate, brake;
  boolean done;
  
  List<Coin> coins;
  int score = 0;
  int lives = 10;
  color score_color = 0xFF000000;
  int coin_rate = 30;
  int time = 0;
 
  Agent(float x, float y)
  {
    pos = new PVector(x, y);
    coins = new ArrayList<Coin>();
  }
  
  void update()
  {
    time++;
    
    if(time >= coin_rate)
    {
      coins.add(new Coin(this));
      time = 0;
    }
    
    
    if (pos.x < d/2)
    {
      pos.x = d/2;
      vel.x = 0;
    }
    
    if (pos.x > width - d/2)
    {
      pos.x = width - d/2;
      vel.x = 0;
    }
    
    if (accelerate)
      vel.x += speed;
    if (brake)
      vel.x -= speed;
    pos.x += vel.x;
    pos.y += vel.y;
  }
  
  void show()
  {
    textSize(32);
    fill(0, 0, 0);
    text(score, 20, 50);
    
    textSize(32);
    fill(0, 0, 0);
    text("Lives: " + lives, width-150, 50);
  
    fill(0);
    ellipse(pos.x, pos.y, d, d);
  
    if (done)
      return;
    if(lives <= 0)
      done = true;
      
    for(Coin coin: coins)
    {
      coin.draw();
    }
  }
  
  void reset()
  {
    coins = new ArrayList<Coin>();
          score = 0;
          lives = 10;
          done = false;
  }
}