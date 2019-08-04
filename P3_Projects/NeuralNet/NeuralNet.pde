String text;

float cont;

//Inilizacion de la variables para la red neuronal
String[] xBrain;
String[] yBrain;
Brain b;

int len;
int[] neuFL = {1};
Net r;

float[] x = new float[2];

void setup() {
  size(1200, 300);

  cont = 10;

  //Cargamos los datos de los txt.
  xBrain = loadStrings("listX.txt");
  yBrain = loadStrings("listY.txt");
  b = new Brain(xBrain, yBrain);

  //Creamos la red con los parametros que deseamos.
  len = b.x[0].length;
  //Se inicializa con pesos aleatorios entre -0.5 y 0.5 (bias incluido)
  r = new Net(neuFL, len);

  //Entrenamos la red.
  b.train(r);
}

void draw() {

  //Inicializo unas entradas aleatorias
  for (int i = 0; i < 2; i++) {
    x[i] = (random(1)<0.5? 0: 1);
  }

  //Mostramos por pantalla cada cierto numero de frames
  if (cont == frameCount) {
    cont += 60;

    background(255);
    fill(0);
    textSize(32);
    text = ("Entradas: " + x[0] + " , " + x[1]);
    text(text, 10, 50);
    text = ("Objetivo: " + b.output(x)[0] + "           Salida: " + r.a(x)[0]);
    text(text, 10, 100);
  }
}
