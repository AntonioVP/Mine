class Capa {

  Neurona[] n;
  int[] results;

  Capa(int len, int x) {
    this.n = new Neurona[len];
    this.results = new int[len];

    for (int i = 0; i < this.n.length; i++) {
      n[i] = new Neurona(x);
    }
  }

  //Resultados de la capa con las entradas proporcionadas
  int[] a(int[] x) {

    for (int i = 0; i < this.n.length; i++) {
      this.results[i] = n[i].a(x);
    }

    return this.results;
  }


  //TODO: Esta funcion entrena a la capa
  void train(int[] x, int[] y) {
  }
}
