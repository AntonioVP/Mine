class LayerOut {

  Neuron[] n;
  float[] results;
  

  public LayerOut(int x, int y, float learningRate, boolean lineal) {
    this.n = new Neuron[y];
    this.results = new float[y];

    for (int i = 0; i < this.n.length; i++) {
      n[i] = new Neuron(x, learningRate, lineal);
    }
  }

  //Resultados de la capa con las entradas proporcionadas
  public float[] a(float[] x) {

    for (int i = 0; i < this.n.length; i++) {
      this.results[i] = n[i].a(x);
    }

    return this.results;
  }

  public float[] errors() {
    float[] result = new float[this.n.length];

    for (int i = 0; i < result.length; i++) {
      result[i] = this.n[i].outputError;
    }

    return result;
  }

  public float[] getResults() {

    float[] copy = new float[this.results.length];

    arrayCopy(results, copy);

    return copy;
  }
  
  public void learn(float[] res){
    
    //Para cada neurona le pasamos los resultados de la capa anterior
    for (int j = 0; j < this.n.length; j++) {

        this.n[j].learn(res);
      }
  }
}
