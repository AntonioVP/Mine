class Capa {

  Neurona[] n;
  float[] results;

  Capa(int len, int x) {
    this.n = new Neurona[len];
    this.results = new float[len];

    for (int i = 0; i < this.n.length; i++) {
      n[i] = new Neurona(x);
    }
  }

  //Resultados de la capa con las entradas proporcionadas
  float[] a(float[] x) {

    for (int i = 0; i < this.n.length; i++) {
      this.results[i] = n[i].a(x);
    }

    return this.results;
  }
}
