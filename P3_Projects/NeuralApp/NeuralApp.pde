//Inilizacion de la variables para la red neuronal
String[] xBrain;
String[] yBrain;
Brain b;

int len;
int[] neuFL = {1};
Net r;

//Auxiliar
int ventana;
boolean cla;
String str_number = "";

//Botones de navegacion
Button b1;
Button b2;
Button b3;
Button b8;

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

  size(800, 600);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  surface.setTitle("Neural Net");
  
  //selectFolder("Select a folder to process:", "folderSelected");
  
  //Inicializacion de red o de brain?
  
  //Inicializacion de los auxiliares
  ventana = 0;
  cla = false;
  str_number = "x";

  //Color de botones y Botones
  color c1 = color(150, 255, 150);
  color c2 = color(255, 150, 0);
  color c3 = color(255);

  b1 = new Button("b1", 0, 100, 160, 75, c1, 32);
  b2 = new Button("b2", 0, -100, 160, 75, c2, 32);
  b3 = new Button("b3", 75, -175, 50, 20, c3, 20);

  b4 = new Button("►", -75, 125, 20, 10, c3, 20);
  b5 = new Button("◄", -125, 125, 20, 10, c3, 20);
  b6 = new Button("►", 125, 125, 20, 10, c3, 20);
  b7 = new Button("◄", 75, 125, 20, 10, c3, 20);

  b8 = new Button("b8", -75, -175, 50, 20, c3, 20);

  //Titulos y textos
  title1 = new Text("Entradas:", -100, -105, 20);
  title2 = new Text("Salidas:", 100, -105, 20);

  text_x = new Text("" + number_x, -100, 150, 20);
  text_y = new Text("" + number_y, 100, 150, 20);

  //Imagenes
  img_red = new Imagen("red", loadImage("images/red.png"), 0, 0, 250, 250);
}

void draw() {

  background(220, 220, 255);
  translate(width/2, height/2);

  dibujaVentana();
}

void dibujaVentana() {

  //Ventana inicial donde se crea una nueva red o se carga una existente.
  if (ventana == 0) {
    //Botones
    b1.t("Nueva red");
    b2.t("Cargar red");
    b1.showAll();
    b2.showAll();
  }

  //Ventana Nueva red donde se elige la modalidad de la red: aritmetica o clasificacion
  if (ventana == 1) {
    //Botones
    b1.t("Lineal");
    b2.t("Clasificación");
    b1.showAll();
    b2.showAll();
  }

  //Obtener valores para la Red
  if (ventana == 2) {

    //Imagen de background
    img_red.show();

    b8.t("Continuar");
    b3.t("Cancelar");

    //Botones
    b8.showAll();
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
  }

  //Proceso de aprendizaje para la nueva red
  if (ventana == 3) {
  }

  if (ventana == 4) {
    fill(0, 0, 0, 255*sin(frameCount/5));
    textSize(35);
    text("Cargando...", 0, 0);
  }

  if (ventana == 5) {
  }

  if (ventana == 6) {
  }
}

void mousePressed() {

  //Ventana 0
  if (ventana == 0) {
    //Boton 1
    if (b1.hit(mouseX, mouseY)) {
      b1.c = color(100, 205, 100);
    }

    //Boton 2
    if (b2.hit(mouseX, mouseY)) {
      b2.c = color(255, 100, 0);
    }
  }

  //Ventana 1
  if (ventana == 1) {
    //Boton 1
    if (b1.hit(mouseX, mouseY)) {
      b1.c = color(100, 205, 100);
      cla = true;
    }

    //Boton 2
    if (b2.hit(mouseX, mouseY)) {
      b2.c = color(255, 100, 0);
      cla = false;
    }
  }

  //Ventana 2
  if (ventana == 2) {

    //Boton 8 Continuar
    if (b8.hit(mouseX, mouseY)) {
      b8.c = color(220);
    }

    //Boton 3 Cancelar
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
  b1.c = color(150, 255, 150);
  b2.c = color(255, 150, 0);
  b3.c = color(255);
  b4.c = color(255);
  b5.c = color(255);
  b8.c = color(255);

  boolean done = false;

  //Ventana 0
  if (ventana == 0) {
    //Boton 1
    if (b1.hit(mouseX, mouseY) || b2.hit(mouseX, mouseY)) {
      ventana = 1;
    }

    //Boton 2
    if (b2.hit(mouseX, mouseY) || b2.hit(mouseX, mouseY)) {
      ventana = 4;
    }

    done = true;
  }

  //Ventana 1
  if (ventana == 1 && !done) {
    //Boton 1 y 2
    if (b1.hit(mouseX, mouseY) || b2.hit(mouseX, mouseY)) {
      ventana = 2;
      //Tipo de red: lineal o clasificacion
    }

    done = true;
  }

  //Ventana 2
  if (ventana == 2 && !done) {
    //Boton 8 Continuar
    if (b8.hit(mouseX, mouseY)) {
      /*
      ventana = vista con red creada/cargada
       */
    }

    //Boton 3 Cancelar
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

    done = true;
  }
}
