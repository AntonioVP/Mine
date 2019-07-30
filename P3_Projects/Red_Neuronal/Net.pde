class Net {

  Layer[] layers;
  float[][] results;
  float lr = 0.01; //Aun no esta implementado que la red entera adopte este factor de aprendizaje.


  Net(int[] neuForLayer, int xForNeu) {
    this.layers = new Layer[neuForLayer.length];
    int max = 1;

    for (int i = 0; i < neuForLayer.length; i++) {
      if (i == 0) {
        this.layers[i] = new Layer(neuForLayer[i], xForNeu);
      } else {
        this.layers[i] = new Layer(neuForLayer[i], neuForLayer[i-1]);
      }

      if (neuForLayer[i] > max) {
        max = neuForLayer[i];
      }
    }

    this.results = new float[max][layers.length];
  }


  //Da el resultado de la red al introducir los valores de entrada
  float[] a(float[] x) {
    float[] a = x;
    float[] _a;

    for (int i = 0; i < layers.length; i++) {
      _a = this.layers[i].a(a);

      this.results[i] = this.layers[i].getResults();

      a = _a;
    }

    return a;
  }


  void learn() {

    //Para cada capa aprendemos
    for (int i = 0; i < layers.length; i++) {

      layers[i].learn(i);
    }
  }

  public float[][] getResults() {

    float[][] copy = new float[results.length][results[0].length];

    for (int i = 0; i < results.length; i++) {

      for (int j = 0; j < results[0].length; j++) {
        copy[i][j] = results[i][j];
      }
    }

    return copy;
  }
}
