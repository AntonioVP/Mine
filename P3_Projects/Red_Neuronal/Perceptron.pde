class Perceptron {

  float[] pesos;
  int b = 0;
  float fa = 0.01;

  Perceptron(float[] pesos) {
    this.pesos = pesos;
  }

  float sumaEntradas(int[] entradas) {
    float calculo = 0;
    for (int i = 0; i < entradas.length; i++) {
      calculo += entradas[i]*pesos[i];
    }
    calculo += b;

    return calculo;
  }

  int salida(int[] entradas) {
    
    //Aqui usamos las funcion activacion para dar el resultado de esta salida.
    float umbral = 1 / (1 + exp(-1 * sumaEntradas(entradas)));

    if (umbral >= 0.75) {
      return 1;
    } else {
      return 0;
    }
  }

  void aprende(int[] entradas, int target) {
    float out = salida(entradas);

    float error = target - out;

    for (int i = 0; i < pesos.length; i++) {
      pesos[i] = pesos[i] + error*entradas[i]*fa;
    }
  }
}
