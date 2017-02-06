class Particle
{
  PVector center;
  float radius;
  float angle;
  float direction;
  PVector[] history;
  float color_value;
  color bodyColor;
  int len;
  float alpha_span;
  
  Particle(PVector ce, float r, float a, float c)
  {
    center = ce.copy();
    radius = r;
    angle = a;
    direction = random(-2, 2);
    len = 32;
    alpha_span = 360 / len;
    color_value = c;
    bodyColor = color(color_value, 255, 255);
    
    history = new PVector[len];
    for(int i = 0; i < history.length; i++)
    {
      history[i] = new PVector(-width, -height);
    }
  }
  
  void update()
  {
    float tmp_r = radius + map(noise(noise_value), 0, 1, -180, 180);
    float x = tmp_r * cos(radians(angle));
    float y = tmp_r * sin(radians(angle));
    
    for(int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i - 1].copy();
    }
    history[0] = new PVector(x, y);
    
    angle += direction;
    //color_value = (color_value + 0.5) % 255;
    //bodyColor = color(color_value, 255, 255);
  }
  
  void display()
  {
    pushMatrix();
    translate(center.x, center.y);
    
    for(int i = history.length - 1; i >= 0; i--)
    {
      noStroke();
      fill(bodyColor, 255 - i * alpha_span);
      
      ellipse(history[i].x, history[i].y, 10, 10);
    }
    
    //fill(255);
    //ellipse(history[0].x, history[0].y, 3, 3);
    
    popMatrix();
  }
}