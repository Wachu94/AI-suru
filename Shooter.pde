import java.util.*;

float[][] data1 = {{3, 4, 5}, {4, 5, 2}};

NeuralNetwork nn = new NeuralNetwork(3, 6, 2);

Agent human;
float speed = 1;

Population population;
int pop_size = 200;
float mutation_rate = 0.1;
boolean AI_ON = true;

int f_rate = 60;
color bg_color = 0xFFFFFFFF;




void setup()
{
  nn.hidden_hidden.output();
  size(800,600);
  frameRate(60);
  if(AI_ON)
    population = new Population(pop_size);
  else
    human = new Agent(width/2, 5 * height/6);
}

void draw()
{
  background(bg_color);
  if (!AI_ON)
  {
    human.update();
    human.show();
  } 
  else
  {
    
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    switch(keyCode)
    {
      case UP:
        mutation_rate *= 2;
        break;
      case DOWN:
        mutation_rate /= 2;
        break;
    }
  } else
  {
    switch(key)
    {
      case '-':
        if (f_rate > 10)
          f_rate -= 10;
          frameRate(f_rate);
          println(f_rate);
          break;
      case '+':
        if (f_rate < 600)
          f_rate += 10;
          frameRate(f_rate);
          println(f_rate);  
          break;
      case 'd':
        if(!AI_ON)
          human.accelerate = true;
          break;
      case 'a':
         if(!AI_ON)
          human.brake = true;
          break;
    }
  }
}

void keyReleased()
{
  switch(key)
    {
      case 'd':
        if(!AI_ON)
          human.accelerate = false;
          break;
      case 'a':
        if(!AI_ON)
          human.brake = false;
          break;
      case 'r':
        if(!AI_ON)
        {
          human.reset();
        }
        break;
      case 'i':
        AI_ON = !AI_ON;
        break;
    }
}