class PerceptronAnd {

  int[] entradas;
  float[] pesos;
  float fa = 0.01;

  PerceptronAnd(int[] entradas, float[] pesos) {
    this.entradas = entradas;
    this.pesos = pesos;
  }

  float calculaSalida() {
    float calculo = 0;
    for (int i = 0; i < entradas.length; i++) {
      calculo += entradas[i]*pesos[i];
    }

    return calculo;
  }

  int out() {

    float umbral = 0.5;

    if (calculaSalida() >= umbral) {
      return 1;
    } else {
      return 0;
    }
  }

  void train() {
    float target = target();
    float out = calculaSalida();

    float error = target - out;

    for (int i = 0; i < pesos.length; i++) {
      pesos[i] = pesos[i] + error*entradas[i]*fa;
    }
  }

  float target() {
    return entradas[0] == 1 && entradas[1] == 1 ? 1:0;
  }
}
