Population test;
PVector goal = new PVector(300, 10);

void setup() {
  size(600, 600);
  test = new Population(600);
}

void draw() {
  background(255);

  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  if (test.allDotsDead()) {
    //Generic algorithm
    test.calculateFit();
    test.naturalSelection();
    test.mutateDemBabies();
  } else {
    test.update();
    test.show();
  }
}
