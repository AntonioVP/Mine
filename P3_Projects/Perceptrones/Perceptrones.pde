String[] datos;

float cont;
float aciertos;
float fallos;
float exito;

int guardar;
boolean guardado;

boolean orOrAnd;

float[] pesosOr = new float[2];
float[] pesosAnd = new float[2];

Perceptron p;
Brain b;

int[] entradas  = new int[2];

void setup() {
  cont = 10;
  aciertos = 0;
  fallos = 0;
  exito = 0;
  guardar = 0;
  guardado = false;
  size(200, 200);

  datos = loadStrings("datos.txt");

  pesosOr[0] = float(datos[1]); 
  pesosOr[1] =  float(datos[2]);

  pesosAnd[0] = float(datos[4]); 
  pesosAnd[1] = float(datos[5]);


  orOrAnd = true; // FALSE para que aprenda el OR y TRUE para que aprenda el And


  if (!orOrAnd) {
    p = new Perceptron(pesosOr);
    b = new Brain(p, "OR");
    println("PRUEBAS PARA EL PERCEPTRON  OR:");
    println();
  } else {
    p = new Perceptron(pesosAnd);
    b = new Brain(p, "AND");
    println("PRUEBAS PARA EL PERCEPTRON  AND:");
    println();
  }
}

void draw() {

  for (int i = 0; i < 2; i++) {
    entradas[i] = (random(1)<0.5? 0: 1);
  }

  if (cont == frameCount) {
    cont += 15;

    println("Entradas: " + entradas[0] + " , " + entradas[1] + "        Pesos: " + b.p.pesos[0] + "  ,  " + b.p.pesos[1]);
    println("Objetivo: " + b.target(entradas) + "           Salida: " + b.p.salida(entradas) + "                         Exito: " + exito*100);

    println();
  }

  if (b.target(entradas) == b.p.salida(entradas)) {
    aciertos += 1;
    guardar++;
  } else {
    fallos += 1;

    b.entrena(entradas);

    guardar = 0;
    guardado = false;
  }

  exito = aciertos / (aciertos + fallos);

  if ((exito*100 >= 95 && !guardado) || (guardar == 360 && exito*100 < 95)) {

    if (b.tipo == "OR") {
      datos[1] = "" + (b.p.pesos[0]);
      datos[2] = "" + (b.p.pesos[1]);
    } else {
      datos[4] = "" + (b.p.pesos[0]);
      datos[5] = "" + (b.p.pesos[1]);
    }

    saveStrings("datos.txt", datos);

    guardar = 0;
    guardado = true;

    aciertos = 0;
    fallos = 0;

    println("GUARDADO");
  }
}
