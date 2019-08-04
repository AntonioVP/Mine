class Neuron {

  int b = -1;
  float wb;

  float[] w;
  float lr = 0.05;

  float outputError = 0.0;


  public Neuron(int x) {
    float[] w = new float[x];
    for (int i = 0; i < x; i++) {
      w[i] = random(-0.5, 0.5);
    }
    this.w = w;
    this.wb = random(-0.5, 0.5);
  }

  //Funcion suma de las entradas segun sus pesos.
  private float in(float[] x) {
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

  public void learn(float[] res) {

    //Actualizamos el peso del bias.
    // WB   =   WB    + lr*   B  * ERROR
    this.wb = this.wb + lr*this.b*this.outputError;

    //Actualizamos el peso de las demas entradas.
    for (int k = 0; k < this.w.length; k++) {

      //  Wk    =    Wk     + lr*  a  * ERROR
      this.w[k] = this.w[k] + lr*res[k] * this.outputError;
    }
  }
}
