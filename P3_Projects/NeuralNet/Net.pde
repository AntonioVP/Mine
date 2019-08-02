class Net {

  Layer[] layers;
  float[][] results;
  float lr = 0.1; //Aun no esta implementado que la red entera adopte este factor de aprendizaje.


  public Net(int[] neuForLayer, int xForNeu) {
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
  public float[] a(float[] x) {
    float[] in = x;
    float[] a;

    for (int i = 0; i < layers.length; i++) {
      a = this.layers[i].a(in);

      this.results[i] = this.layers[i].getResults();

      in = a;
    }

    return in;
  }


  public void learn(float[] x) {

    //Para cada capa aprendemos con los resultados de la capa anterior
    for (int i = 0; i < layers.length; i++) {

      if (i == 0) {
        layers[i].learn(x);
      } else {
        layers[i].learn(layers[i-1].getResults());
      }
    }
  }

  public float[][] getResults() {

    float[][] copy = new float[results.length][results[0].length];

    arrayCopy(results, copy);

    return copy;
  }
}
