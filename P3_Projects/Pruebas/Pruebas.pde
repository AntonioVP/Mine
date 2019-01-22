boolean pressedL;
boolean pressedR;
float desp;
String act;
String last;

void setup() {
  size(800, 300);
  ellipseMode(CENTER);

  pressedL = false;
  pressedR = false;
  desp = 0;
  act = "";
  last = "";
}

void draw() {
  background(255);

  fill(0);

  if (keyPressed) {
    act = key + "";
    textSize(32);
    text(act, 50, 50);
  }
}

void keyReleased() {
  keyPressed = false;
  key = ' ';
}
