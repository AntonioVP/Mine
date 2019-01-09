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

PerceptronOr pOr;
PerceptronAnd pAnd;

int[] entradasOr  = new int[2];
int[] entradasAnd  = new int[2];

void setup() {
  cont = 10;
  aciertos = 0;
  fallos = 0;
  exito = 0;
  guardar = 0;
  guardado = false;
  size(200, 200);

  orOrAnd = true;     //False es para el perceptron Or y true para el pereceptron And.

  datos = loadStrings("datos.txt");

  pesosOr[0] = float(datos[1]); 
  pesosOr[1] =  float(datos[2]);
  pesosAnd[0] = float(datos[4]); 
  pesosAnd[1] = float(datos[5]);

  pOr = new PerceptronOr(entradasOr, pesosOr);
  pAnd = new PerceptronAnd(entradasAnd, pesosAnd);

  if (!orOrAnd) {
    println("PRUEBAS PARA EL PERCEPTRON  OR:");
    println();
  } else {
    println("PRUEBAS PARA EL PERCEPTRON  AND:");
    println();
  }
}

void draw() {

  //Perceptron Or
  if (!orOrAnd) {
    if (cont == frameCount) {
      cont += 20;

      print("Pesos: " + pOr.pesos[0] + "  ,  " + pOr.pesos[1]);
      println("            Exito: " + exito*100);
    }

    for (int i = 0; i < entradasOr.length; i++) {
      entradasOr[i] = (random(1)<0.5? 0: 1);
    }

    if (pOr.target() == pOr.out()) {
      aciertos += 1;
    } else {
      fallos += 1;
      guardado = false;
    }

    if (pOr.target() != pOr.out()) {
      pOr.train();
      guardar = 0;
    } else {
      guardar++;
    }

    if ((exito*100 >= 95 && !guardado) || (guardar == 360 && exito*100 < 95)) {
      datos[1] = "" + (pOr.pesos[0]);
      datos[2] = "" + (pOr.pesos[1]);

      saveStrings("datos.txt", datos);

      guardar = 0;
      guardado = true;

      println("GUARDADO");
    }

    exito = aciertos / (aciertos + fallos);
  }




  // Perceptron And
  if (orOrAnd) {
    if (cont == frameCount) {
      cont += 20;

      print("Pesos: " + pAnd.pesos[0] + "  ,  " + pAnd.pesos[1]);
      println("            Exito: " + exito*100);
    }

    for (int i = 0; i < entradasAnd.length; i++) {
      entradasAnd[i] = (random(1) < 0.5 ? 0: 1);
    }

    if (pAnd.target() == pAnd.out()) {
      aciertos += 1;
    } else {
      fallos += 1;
      guardado = false;
    }

    if (pAnd.target() != pAnd.out()) {
      pAnd.train();
      guardar = 0;
    } else {
      guardar++;
    }

    if ((exito*100 >= 95 && !guardado) || (guardar == 360 && exito*100 < 95)) {
      datos[4] = "" + (pAnd.pesos[0]);
      datos[5] = "" + (pAnd.pesos[1]);

      saveStrings("datos.txt", datos);

      guardar = 0;
      guardado = true;

      println("GUARDADO");
    }
  }

  exito = aciertos / (aciertos + fallos);
}
