class Neurona {

  int b = -1;
  float wb = 1;

  float[] w;
  float lr = 0.01;


  Neurona(int x) {
    float[] w = new float[x];
    for (int i = 0; i < x; i++) {
      w[i] = random(1);
    }
    this.w = w;
  }

  //Funcion suma de las entradas segun sus pesos.
  float in(float[] x) {
    float in = 0;

    for (int i = 0; i < x.length; i++) {
      in += x[i]*w[i];
    }

    in += b*wb;

    return in; //<>//
  }


  //Funcion de activacion sigmoide. La derivada de la funcion sigmoide es:   g'(in) = g(in)*(1 - g(in)).
  float g(float in) {
    return 1 / (1 + exp(-1 * in));
  }


  //Esta funcion devuelve la salida de la neurona.
  float a(float[] x) {

    float sig = g(in(x));

    return sig;
  }
}
