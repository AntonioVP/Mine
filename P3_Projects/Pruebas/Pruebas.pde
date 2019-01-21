boolean pressed;
String letra;

void setup() {
  size(1200, 300);

  pressed = false;
  letra = "Esto es un texto";
}

void draw() {
  background(255);

  fill(0);
  textSize(32);
  text(letra, width/2-5, height/2);

  println(letra);
}

void keyPressed() {

  if (pressed == false) {
    letra = key + "";
    pressed = true;
  }
}

void keyReleased() {
  if (pressed == true) {
    letra = "";
    pressed = false;
  }
}
