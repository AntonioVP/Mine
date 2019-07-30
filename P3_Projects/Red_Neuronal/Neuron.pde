class Neuron {

  int b = -1;
  float wb = 1;

  float[] w;
  float lr = 0.01;

  float outputError = 0.0;


  Neuron(int x) {
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
      in += x[i]*this.w[i];
    }

    in += this.b*this.wb;

    return in;
  }


  //Funcion de activacion sigmoide. La derivada de la funcion sigmoide es:   g'(in) = g(in)*(1 - g(in)).
  float g(float in) {
    return 1.0 / (1.0 + exp(-1.0 * in));
  }

  //Esta funcion devuelve la salida de la neurona segun las entradas.
  float a(float[] x) {

    float sig = this.g(this.in(x));

    return sig;
  }

  public void learn(int l, int j, float result) {

    //Actualizamos el peso del bias.
    // WB   =   WB    + lr*   B  * ERROR
    this.wb = this.wb + lr*this.b*this.outputError;
    println();
    println("El peso del Bias de la capa " + l + " en la neurona " + j + " es de " + this.wb);

    //Actualizamos el peso de las demas entradas.
    for (int k = 0; k < this.w.length; k++) {

      //  Wk    =    Wk     + lr*  a  * ERROR
      this.w[k] = this.w[k] + lr*result * this.outputError;

      println("El peso de la entrada " + k + " de la neurona " + j + " de la capa " + l + " es de " + this.w[k]);
    }
  }
}
