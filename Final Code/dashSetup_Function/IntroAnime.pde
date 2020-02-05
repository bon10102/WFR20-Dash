//car driving across variables
PImage car;
PImage blackLogo;
int totalFrames =120;
int counter =0;

//car driving across animation
void introAnime() {

  float percent = (float)counter/totalFrames;
  render(percent);
  counter++;
}
//function for car driving across
void render(float percent) {//for car driving across
  if (counter<120) {
    background(0);
    image(car, percent*width, height/2);
  } else {
    background(255);
    imageMode(CENTER);
    image(blackLogo, 400, 200);
  }
}
