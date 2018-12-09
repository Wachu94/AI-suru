class Coin
{
  PVector pos;
  PVector vel;
  int d = 30;
  color fill_color = 0xFFFFFF00;
  boolean earned, lost;
  Agent agent;
  
  Coin(Agent agent)
  {
    pos = new PVector();
    vel = new PVector();
    pos.x = random(width-2*d) + d;
    pos.y = 0;
    vel.y = 5;
    this.agent = agent;
  }
  
  void update()
  {
    pos.y += vel.y;
  }
  
  void draw()
  {
    if(earned || lost)
      return;
    update();
    fill(fill_color);
    ellipse(pos.x,pos.y,d,d);
    check();
  }
  
  void check()
  {
    if(abs(agent.pos.x - pos.x) < d && abs(agent.pos.y - pos.y) < d)
    {
      earned = true;
      agent.score++;
    }
    if(pos.y >height-50)
    {
      lost = true;
      agent.lives--;
    }
  }
}