Particle[] particles = new Particle[1000];
int toxicCount = 0; 
int sizer = 500;
int speedScale = 10;
void setup()
{
  for (int index = 0; index < particles.length; index++) {
    particles[index] = new Particle();
    particles[index].show();
  }
  size(500, 500);
}
void draw()
{
  background(135, 206, 235);
  fill(127, 131, 143);
  quad(70, -20, 30, -20, 230, 250, 265, 245);
  for (int index = 0; index < particles.length; index++) {
    particles[index].move();
    particles[index].show();
    if (particles[index].y > sizer)
     {
       if (toxicCount < 1) {
         int randomNumber = (int)(Math.random()*7000);
         if (randomNumber % 2000 == 0) toxicCount = randomNumber/4;
       }
       if (toxicCount > 0) {
         particles[index] = new ToxicWaste();
         toxicCount -= 1;
       } else {
         particles[index] = new Particle();
       }
    }
  }
//  fill(0);
//  text(mouseX, 20, 100);
//  text(mouseY, 40, 100);
}
class Particle
{
 double x, y, angle, Xspeed, Yspeed;
 String nameOfType;
 color colorType;
  Particle() {
    x = sizer/2;
    y = sizer/2;
    angle = Math.random()*2*(Math.PI);
    double speed = Math.random()*speedScale;
    nameOfType = "Starfield$Particle";
    Xspeed = speed;
    Yspeed = speed;
    colorType = color(135, 206, 235);
  }
  void constructor() {
    x = sizer/2;
    y = sizer/2;
    angle = Math.random()*2*(Math.PI);
    double speed = Math.random()*speedScale;
    Xspeed = speed;
    Yspeed = speed;
    colorType = color(135, 206, 235);
  }
  void move() {
    x += Math.cos(angle)*Xspeed;
    y += Math.sin(angle)*Yspeed;
    if (angle >= Math.PI) {
      Yspeed -= speedScale*.075;
    } else {
      Yspeed += speedScale*.075;
    }
  }
  void show() {
    if (this.nameOfType == "Starfield$Particle") {
      fill(colorType);
      ellipse((float)x,(float)y, 5, 7);
    } else {
      fill(colorType);
      ellipse((float)x,(float)y, (int)(Math.random()*7)+3, (int)(Math.random()*10)+4);
    }
  }
}

class ToxicWaste extends Particle {
  ToxicWaste() {
    x = sizer/2;
    y = sizer/2;
    angle = Math.random()*2*(Math.PI);
    double speed = Math.random()*speedScale;
    Xspeed = speed;
    Yspeed = speed;
    nameOfType = "Starfield$ToxicWasteParticle";
    colorType = color(0);
  }
}
