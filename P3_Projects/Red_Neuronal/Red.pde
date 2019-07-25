class Red {

  Capa[] layers;
  float[][] results;
  float lr = 0.01; //Aun no esta implementado que la red entera adopte este factor de aprendizaje.


  Red(int[] neuForLayer, int xForNeu) {
    layers = new Capa[neuForLayer.length];
    int max = 1;

    for (int i = 0; i < neuForLayer.length; i++) {
      if (i == 0) {
        layers[i] = new Capa(neuForLayer[i], xForNeu);
      } else {
        layers[i] = new Capa(neuForLayer[i], neuForLayer[i-1]);
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
      _a = layers[i].a(a);

      this.results[i] = _a;

      a = _a;
    }

    return a;
  }


  void learn(float[][] errors) {

    for (int i = 0; i < layers.length; i++) {

      int l = layers.length - (i+1);

      for (int j = 0; j < layers[l].n.length; j++) {

        //Actualizamos el peso del bias.
        //     WB         =          WB       +  lr * B * ERROR
        layers[l].n[j].wb = layers[l].n[j].wb + -1*lr*errors[l][j];
        println();
        println("El peso del Bias de la capa " + l + " en la neurona " + j + " es de " + layers[l].n[j].wb);
        
        //Numero de pesos de las entradas de la neurona actual
        int numW = layers[l].n[j].w.length;

        //Actualizamos el peso de las demas entradas.
        for (int k = 0; k < numW; k++) {

          //       Wk         =         Wk          +  lr *  aj  * ERRORj
          layers[l].n[j].w[k] = layers[l].n[j].w[k] + lr*results[l][j] * errors[l][j];
          
          println("El peso de la entrada " + k + " de la neurona " + j + " de la capa " + l + " es de " + layers[l].n[j].w[k]);
        }
      }
    }
  }
}
