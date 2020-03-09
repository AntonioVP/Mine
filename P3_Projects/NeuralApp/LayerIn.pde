class LayerIn {

  float[] results;
  

  public LayerIn(int x) {
    this.results = new float[x];
  }

  //Resultados de la capa con las entradas proporcionadas
  public float[] a(float[] x) {

    this.results = x;

    return this.results;
  }
  
  public float[] getResults() {

    float[] copy = new float[this.results.length];

    arrayCopy(results, copy);

    return copy;
  }
}
