//Auxiliar
int ventana;
boolean cla;
String str_number = "";

//Botones de navegacion
Button b1;
Button b2;
Button b3;

//Botones de aumento/disminucion
Button b4;
Button b5;
Button b6;
Button b7;

//Inputs para obtener valores y variables. Valores que obtenemos del usuario.
int number_x = 1;
int number_y = 1;

//Titulos
Text title1;
Text title2;

//Textos
Text text_x;
Text text_y;

//Imagenes
Imagen img_red;

void setup() {

  size(400, 400);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  //surface.setTitle("Neural Net");
  //selectFolder("Select a folder to process:", "folderSelected");

  //Inicializacion de los auxiliares
  ventana = 0;
  cla = false;
  str_number = "x";

  //Color de botones y Botones
  color c1 = color(150, 255, 150);
  color c2 = color(255, 150, 0);
  color c3 = color(255);

  b1 = new Button("clasificacion", 0, 100, 160, 75, c1, "Clasificacion", 32);
  b2 = new Button("aritmetica", 0, -100, 160, 75, c2, "Aritmetica", 32);
  b3 = new Button("volver", 0, -175, 50, 20, c3, "Volver", 20);

  b4 = new Button("aumentaX", -75, 125, 20, 10, c3, "→", 20);
  b5 = new Button("disminuyeX", -125, 125, 20, 10, c3, "←", 20);
  b6 = new Button("aumentaY", 125, 125, 20, 10, c3, "→", 20);
  b7 = new Button("disminuyeY", 75, 125, 20, 10, c3, "←", 20);

  //Titulos y textos
  title1 = new Text("Entradas:", -100, 175, 20);
  title2 = new Text("Salidas:", 100, 175, 20);

  text_x = new Text("" + number_x, -100, 150, 20);
  text_y = new Text("" + number_y, 100, 150, 20);

  //Imagenes
  img_red = new Imagen("red", loadImage("red.png"), 0, 0, 250, 250);
}

void draw() {

  background(220, 220, 255);
  translate(width/2, height/2);

  dibujaVentana();


  //if (mouseX < 50) {
  //  cursor(WAIT);
  //} else {
  //  cursor(TEXT);
  //}
}

void dibujaVentana() {

  //Ventana inicial donde se elige la modalidad de la red: aritmetica o clasificacion
  if (ventana == 0) {
    //Botones
    b1.showAll();
    b2.showAll();
  }

  //Obtener valores para la Red
  if (ventana == 1) {

    //Imagen de background
    img_red.show();

    //Botones
    b3.showAll();

    b4.showAll();
    b5.showAll();
    b6.showAll();
    b7.showAll();

    //Para las entradas
    title1.show();
    text_x.show();

    //Para las salidas
    title2.show();
    text_y.show();

    //Imagen de primer plano
  }

  //Tabla de aprendizaje?
  if (ventana == 2) {
  }
}

void keyPressed() {
}

void mousePressed() {

  //Ventana 0
  if (ventana == 0) {
    //Boton 1
    if (b1.hit(mouseX, mouseY)) {
      b1.c = color(100, 100, 255);
      cla = true;
    }

    //Boton 2
    if (b2.hit(mouseX, mouseY)) {
      b2.c = color(255, 100, 0);
      cla = false;
    }
  }

  //Ventana 1
  if (ventana == 1) {

    //Boton 3
    if (b3.hit(mouseX, mouseY)) {
      b3.c = color(220);
    }

    //Boton 4
    if (b4.hit(mouseX, mouseY)) {
      b4.c = color(220);
    }

    //Boton 5
    if (b5.hit(mouseX, mouseY)) {
      b5.c = color(220);
    }
  }
}

void mouseReleased() {
  b1.c = color(150, 150, 255);
  b2.c = color(255, 150, 0);
  b3.c = color(255);
  b4.c = color(255);
  b5.c = color(255);

  //Ventana 0
  if (ventana == 0) {
    //Boton 1 y 2
    if (b1.hit(mouseX, mouseY) || b2.hit(mouseX, mouseY)) {
      ventana = 1;
    }
  }

  //Ventana 1
  if (ventana == 1) {
    //Boton 3
    if (b3.hit(mouseX, mouseY)) {
      ventana = 0;
      str_number = "";
      number_x = 0;
      number_y = 0;
    }

    //Boton 4
    if (b4.hit(mouseX, mouseY)) {

      if (number_x < 4) number_x++;
      text_x.tx = "" + number_x;
    }

    //Boton 5
    if (b5.hit(mouseX, mouseY)) {
      if (number_x > 1) number_x--;
      text_x.tx = "" + number_x;
    }

    //Boton 6
    if (b6.hit(mouseX, mouseY)) {
      if (number_y < 4) number_y++;
      text_y.tx = "" + number_y;
    }

    //Boton 7
    if (b7.hit(mouseX, mouseY)) {
      if (number_y > 1) number_y--;
      text_y.tx = "" + number_y;
    }
  }
}
