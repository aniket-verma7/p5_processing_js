ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() 
{
  size(128, 128);
}

void draw() 
{
  background(0);

  fire();
}

void fire()
{
  for (int i = 0; i < 10; i++) {
    Particle p = new Particle();
    particles.add(p);
  }
  for (int i = particles.size() - 1; i >= 0; i--) {
    particles.get(i).update();
    particles.get(i).show();
    if (particles.get(i).finished()) {
      particles.remove(i);
    }
  }
 
}
