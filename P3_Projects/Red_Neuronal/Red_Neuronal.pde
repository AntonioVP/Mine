String texto;

float cont;
float aciertos;
float fallos;
float exito;

int guardar;
boolean guardado;

//Inilizacion de la variables para la red neuronal
String[] xBrain;
String[] yBrain;
Brain b;

int len;
int[] neuFL = {2, 1};
Red r;

float[] x = new float[2];

void setup() {
  size(1200, 300);

  cont = 10;
  aciertos = 0;
  fallos = 0;
  exito = 0;
  guardar = 0;
  guardado = false;

  //Cargamos los datos de los txt.
  xBrain = loadStrings("listX.txt");
  yBrain = loadStrings("listY.txt");
  b = new Brain(xBrain, yBrain);

  //Creamos la red con los parametros que deseamos.
  len = b.x[0].length;
  r = new Red(neuFL, len);

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
    texto = ("Entradas: " + x[0] + " , " + x[1]);
    text(texto, 10, 50);
    texto = ("Objetivo: " + b.output(x)[0] + "           Salida: " + r.a(x)[0]);
    text(texto, 10, 100);
  }




  //A partir de aqui esta el anterior sistema de aprendizaje .

  /*
  //Contador de aciertos
   if (r.a(x) == b.output(x)) {
   aciertos += 1;
   guardar++;
   } else {
   r.entrena(x);
   
   fallos += 1;
   guardar = 0;
   guardado = false;
   }
   
   //Se calcula el porcentaje de exito de la red
   exito = aciertos / (aciertos + fallos);
   
   //Segun el contador y el porcentaje de exito, guarda los resultados de los pesos
   if ((exito*100 >= 95 && !guardado) || (guardar == 360 && exito*100 < 95)) {
   
   datos[0] = "" + (r.n.pesos[0]);
   datos[1] = "" + (r.n.pesos[1]);
   
   saveStrings("tabla.txt", datos);
   
   guardar = 0;
   guardado = true;
   
   aciertos = 0;
   fallos = 0;
   
   texto = ("GUARDADO");
   text(texto, 10, 150);
   
   }
   */
}
