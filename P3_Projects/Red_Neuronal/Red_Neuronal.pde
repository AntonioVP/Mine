String[] datos;

float cont;
float aciertos;
float fallos;
float exito;

int guardar;
boolean guardado;

float[] pesos = new float[2];

Neurona n;
Red r;

int[] entradas  = new int[2];

void setup() {
  cont = 10;
  aciertos = 0;
  fallos = 0;
  exito = 0;
  guardar = 0;
  guardado = false;
  size(200, 200);

  datos = loadStrings("tabla.txt");

  pesos[0] = float(datos[0]); 
  pesos[1] =  float(datos[1]);

  String entrada1 = datos[2];
  String entrada2 = datos[3];
  String salida = datos[4];

  n = new Neurona(pesos);
  r = new Red(n, entrada1, entrada2, salida);
}

void draw() {

  //Inicializo unas entradas aleatorias
  for (int i = 0; i < 2; i++) {
    entradas[i] = (random(1)<0.5? 0: 1);
  }

  //Mostramos por pantalla cada cierto nuemero de frames
  if (cont == frameCount) {
    cont += 15;

    println("Entradas: " + entradas[0] + " , " + entradas[1] + "        Pesos: " + r.n.pesos[0] + "  ,  " + r.n.pesos[1] + "      Peso BIAS: " + r.n.wb);
    println("Objetivo: " + r.target(entradas) + "           Salida: " + r.n.salida(entradas) + "                                            Exito: " + exito*100);
    println();
  }

  //Contador de aciertos
  if (r.target(entradas) == r.n.salida(entradas)) {
    aciertos += 1;
    guardar++;
  } else {
    r.entrena(entradas);

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

    println("GUARDADO");
  }
}
