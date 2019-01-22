class Red {

  Neurona n;

  Capa[] layers;
  int[][] results;
  float fa = 0.01;


  Red(int[] neuForLayer, int[] x) {
    layers = new Capa[neuForLayer.length];
    
    for (int i = 0; i < neuForLayer.length; i++) {
      if (i == 0) {
        layers[i] = new Capa(neuForLayer[i], x.length);
      } else {
        layers[i] = new Capa(neuForLayer[i], neuForLayer[i-1]);
      }
    }
  }


  //Da el resultado de la red al introducir los valores de entrada
  int[] a(int[] x) {
    int[] a = x;
    int[] _a;

    for (int i = 0; i < layers.length; i++) {
      _a = layers[i].a(a);
      
      results[i] = _a;
      
      a = _a;
    }

    return a;
  }


  //TODO: Esta funcion entrena a la red 
  void train(int[] x, int[] y) {
  }
}
