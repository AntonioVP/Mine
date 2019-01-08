float tam = 300;
float vel = 0.007;
float rotX = -0.25;
float rotY = 0.5;
float lejania = -tam;

int nivel = 2;

Cubo cubo;

void setup() {
  size(800, 600, P3D);
  cubo = new Cubo(nivel);
}

void draw() {

  background(255);
  translate(width/2, height/2, lejania);

  pushMatrix();

  if (mousePressed) {
    rotX += -(mouseY - pmouseY)*vel;
    rotY += (mouseX - pmouseX)*vel;

    rotateX(rotX);
    rotateY(rotY);
  } else {
    rotateX(rotX);
    rotateY(rotY);
  }

  cubo.show();

  popMatrix();
}

void keyPressed() {

  //Alejar y acercar
  if ((key == 'l' || key == 'L')) {
    lejania -= 20;
  } else if ((key == 'p' || key == 'P')) {
    lejania += 20;
  }

  //Rotacion frontal, F
  if (key == 'q') {
    cubo.move(Move.F);
  }
  //Rotacion frontal prima, Fp
  if (key == 'w') {
    cubo.move(Move.Fp);
  }
  //Rotacion trasera, B
  if (key == 'a') {
    cubo.move(Move.B);
  }
  //Rotacion trasera prima, Bp
  if (key == 's') {
    cubo.move(Move.Bp);
  }




  if (key == 'r') {
    cubo = new Cubo(nivel);
  }
}
