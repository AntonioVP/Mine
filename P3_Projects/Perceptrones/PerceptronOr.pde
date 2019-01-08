class PerceptronOr {

  int[] entradas;
  float[] pesos;
  float fa = 0.05;

  PerceptronOr(int[] entradas, float[] pesos) {
    this.entradas = entradas;
    this.pesos = pesos;
  }

  int calculaSalida() {
    float calculo = 0;
    for (int i = 0; i < entradas.length; i++) {
      calculo += entradas[i]*pesos[i];
    }


    return funcionAct(calculo);
  }

  int funcionAct(float calculo) {
    if (calculo >=1) {
      return 1;
    } else {
      return 0;
    }
  }

  void train() {
    int target = target();
    int salida = calculaSalida();

    int error = target - salida;

    for (int i = 0; i < pesos.length; i++) {
      pesos[i] = pesos[i] + error*entradas[i]*fa;
    }
  }

  int target() {
    return entradas[0] == 1 || entradas[1] == 1?1:0;
  }
}
