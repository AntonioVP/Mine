int ancho = 680;
int alto = 480;

int x1 = 100;
int y1 = 40;
int wB1 = ancho - 2*x1;
int hB1 = 150;
color c1 = color(175);

int x2 = 100;
int y2 = 40 + y1 + hB1;
int wB2 = wB1;
int hB2 = hB1;
color c2 = color(255, 100, 100) ;

int ventana = 1;

String str_number = "";
int number_x = 0;
int number_y = 0;
String str_number_x = "";
String str_number_y = "";

void setup() {

  fill(255);
  size(ancho, alto);
}

void draw() {

  background(255);

  dibujaVentana();
}

void dibujaVentana() {

  if (ventana == 0) {

    fill(c1);
    rect(x1, y1, wB1, hB1);

    fill(0);
    textSize(32);
    text("Clasificacion", wB1/2, y1 + hB1/2);


    fill(c2);
    rect(x2, y2, wB2, hB2);

    fill(0);
    textSize(32);
    text("Aritmetica", 15+ wB2/2, y2 + hB2/2);
  }

  //Clasificacion
  if (ventana == 1) {

    if (number_x == 0) {
      fill(0);
      textSize(16);
      text("¿Cuantos valores de ENTRADA son necesarios?", wB1/3, y1 + hB1/2);

      str_number = "x";

      if (str_number_x.length() > 0) {
        fill(0);
        textSize(32);
        text(str_number_x, wB1/2, y1 + hB1/2 + 50);
      }
    } else if (number_y == 0){
      fill(0);
      textSize(16);
      text("¿Cuantos valores de SALIDA son necesarios?", wB1/3, y1 + hB1/2);

      str_number = "y";

      if (str_number_y.length() > 0) {
        fill(0);
        textSize(32);
        text(str_number_y, wB1/2, y1 + hB1/2 + 50);
      }
    }
    
    //Obtener la tabla de aprendizaje
  }

  //Aritmetica
  if (ventana == 2) {
  }
}

void keyPressed() {

  if (str_number == "x" && key >= '0' && key <= '9') {
    str_number_x += key;
  } else if (str_number == "y" && key >= '0' && key <= '9') {
    str_number_y += key;
  }

  if (key == ENTER) {
    if (str_number == "x") {
      number_x = int(str_number_x);
    } else if (str_number == "y") {
      number_y = int(str_number_y);
    }
  }
}

void mousePressed() {

  //Boton 1
  if ((mouseX > x1 && mouseX < x1 + wB1) && (mouseY > y1 && mouseY < y1 + hB1)) {
    c1 = color(50);
    ventana = 1;
  }

  //Boton 2
  if ((mouseX > x2 && mouseX < x2 + wB2) && (mouseY > y2 && mouseY < y2 + hB2)) {
    c2 = color(0, 255, 0);
    ventana = 2;
  }
}

void mouseReleased() {
  c1 = color(175);
  c2 = color(255, 100, 100);
}
