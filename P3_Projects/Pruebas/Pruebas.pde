float vel = 0.01;
float rotX = 0;
float rotY = 0;

PVector p1 = new PVector(150, 0, 0);

PVector p2;
PVector p3;

PVector centro = new PVector(0, 0, 0);
Caja caja = new Caja(50, centro);

void setup() {
  size(800, 600, P3D);
  textSize(16);
}

void draw() {
  background(255);

  translate(width/2, height/2);

  pushMatrix();

  rotateX((float)1);
  rotateY((float)0);
  rotateZ((float)0.25);

  line(0, 0, 0, 100, 0, 0);
  line(0, 0, 0, 0, 100, 0);
  line(0, 0, 0, 0, 0, 100);

  if (mousePressed) {
    caja.mover();
  }

  caja.show();

  popMatrix();
}
