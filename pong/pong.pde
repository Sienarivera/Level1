int xposition = 0;
int yposition = 0;
int xspeed = 9;
int yspeed = 9;
import ddf.minim.*;
Minim minim;
AudioSample sound;
PImage backgroundImage;

boolean intersects (int ballX, int ballY, int paddleX, int paddleY, int paddleLength){
  if (ballY > paddleY - paddleLength && ballX > paddleX && ballX < paddleX + paddleLength){
  return true;
}
  
    else {
      return false;
    }
}

void setup(){
backgroundImage = loadImage("maxresdefault.jpeg");
size(1000,1000);
minim = new Minim (this);
sound = minim.loadSample("pong.wav");



}

void draw(){
xposition+=xspeed;
yposition+=yspeed;
if (intersects(mouseX, 900, mouseX, 900, 100)== true){
  xspeed =-xspeed;
  yspeed =-yspeed;
  sound.trigger();
  
}

if (xposition >=999 || xposition <=0){
  xspeed = -xspeed;
  sound.trigger();
}
if (yposition >=999 || yposition <=0){
  yspeed = -yspeed;
}
image(backgroundImage, 0,0,1000,1000);
ellipse(xposition,yposition,50,50);
rect (mouseX, 900, 100,25);
fill(230,230,230);
stroke(200,200,200);


}

