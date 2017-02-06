ArrayList<Particle> particles;
float radius;
float noise_value;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  blendMode(ADD);
  
  particles = new ArrayList<Particle>();
  
  for(int i = 0; i < 32; i++)
  {
    particles.add(new Particle(new PVector(width / 2, height / 2), 100, random(360), 0));
    particles.add(new Particle(new PVector(width / 2, height / 2), 100, random(360), 85));
    particles.add(new Particle(new PVector(width / 2, height / 2), 100, random(360), 170));
  }
}

void draw()
{
  background(0);
  noise_value += 0.025;
  
  for(Particle p : particles)
  {
    p.update();
    p.display();    
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 3600)
  {
     exit();
  }
  */
}