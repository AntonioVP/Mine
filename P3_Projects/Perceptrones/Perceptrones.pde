String[] datos;

int cont;
int aciertos;
boolean guardado;

float[] pesosOr = new float[2];
float[] pesosAnd = new float[2];

PerceptronOr pOr;

int[] entradasOr  = new int[2];

void setup() {
  cont = 10;
  aciertos = 0;
  guardado = false;
  size(200, 200);

  datos = loadStrings("datos.txt");

  pesosOr[0] = float(datos[1]); 
  pesosOr[1] =  float(datos[2]);
  pesosAnd[0] = float(datos[4]); 
  pesosAnd[1] = float(datos[5]);

  pOr = new PerceptronOr(entradasOr, pesosOr);
}

void draw() {
  if (cont == frameCount) {
    cont += 20;

    for (int i = 0; i < entradasOr.length; i++) {
      entradasOr[i] = (random(1)<0.5? 0: 1);
    }

    print("Entradas: "+ entradasOr[0] + " , " + entradasOr[1] + "   ");
    println("Pesos: " + pOr.pesos[0] + "  ,  " + pOr.pesos[1]);

    print("Objetivo: "+ pOr.target() + "   ");
    print("Salida: ", pOr.calculaSalida());
    if (pOr.target() == pOr.calculaSalida()) {
      println("                             Acierto");
      aciertos += 1;
    } else {
      println("                             Fallo");
      aciertos = 0;
    }

    println();

    pOr.train();

    if (aciertos > 20 && !guardado) {
      datos[1] = "" + (pOr.pesos[0]);
      datos[2] = "" + (pOr.pesos[1]);

      saveStrings("datos.txt", datos);

      guardado = true;

      println("GUARDADO");
    }
  }
}
