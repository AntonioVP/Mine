class Neurona {

  int b = -1;
  float wb = 1;
  float[] pesos;
  float fa = 0.01;

  Neurona(float[] pesos) {
    this.pesos = pesos;
  }

  Neurona(float[] pesos, int bias) {
    this.pesos = pesos;
    this.b = bias;
  }

  Neurona(int entradas) {
    float[] w = new float[entradas];
    for (int i = 0; i < entradas; i++) {
      w[i] = random(1);
    }
    this.pesos = w;
  }

  //Funcion suma de las entradas segun sus pesos
  float in(int[] entradas) {
    float calculo = 0;
    for (int i = 0; i < entradas.length; i++) {
      calculo += entradas[i]*pesos[i];
    }
    calculo += b*wb;

    return calculo;
  }

  //Funcion de activacion sigmoide.
  float g(float suma) {
    return 1 / (1 + exp(-1 * suma));
  }

  //Esta funcion devuelve la salida de la neurona segun las entradas y los pesos de las mismas.
  int a(int[] entradas) {

    float sig = g(in(entradas));

    if (sig >= 0.5) {
      return 1;
    } else {
      return 0;
    }
  }

  void aprende(int[] entradas, int target) {
    float out = a(entradas);

    float error = target - out;

    wb = wb + error*fa;

    for (int i = 0; i < pesos.length; i++) {
      pesos[i] = pesos[i] + error*entradas[i]*fa;
    }
  }
}
