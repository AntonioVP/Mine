class Net {

  LayerIn layerIn;
  LayerHi[] layerHi;
  LayerOut layerOut;
  float[][] results;

  float lr = 0.1; //Aun no esta implementado que la red entera adopte este factor de aprendizaje.



  public Net(int x, int y) {

    this.layerIn = new  LayerIn(x);
    this.layerOut = new LayerOut(x, y);
    
    this.results = new float[2][];
    this.results[0] = new float[x];
    this.results[1] = new float[y];
  }
  
  public Net(int x, int y, int hidden) {

    this.layerIn = new  LayerIn(x);
    this.layerHi = new LayerHi[1];
    this.layerHi[0] = new LayerHi(x, hidden);
    this.layerOut = new LayerOut(hidden, y);
    
    this.results = new float[2][];
    this.results[0] = new float[x];
    this.results[1] = new float[hidden];
    this.results[1] = new float[y];
  }
  
  public Net(int x, int y, int hidden1, int hidden2) {

    this.layerIn = new  LayerIn(x);
    this.layerHi = new LayerHi[2];
    this.layerHi[0] = new LayerHi(x, hidden1);
    this.layerHi[0] = new LayerHi(hidden1, hidden2);
    this.layerOut = new LayerOut(hidden2, y);
    
    this.results = new float[2][];
    this.results[0] = new float[x];
    this.results[1] = new float[hidden1];
    this.results[1] = new float[hidden2];
    this.results[1] = new float[y];
  }

  //Da el resultado de la red al introducir los valores de entrada
  public float[] a(float[] x) {
    float[] a;

    layerIn.a(x);
    a = layerIn.getResults();
    this.results[0] = a;

    if (layerHi != null) {
      for (int i = 0; i < layerHi.length; i++) {
        layerHi[i].a(a);
        a = layerHi[i].getResults();
        this.results[i] = a;
      }
    }
    layerOut.a(a);
    a = layerOut.getResults();
    this.results[results.length -1] = a;

    return a;
  }


  public void learn() {

    //Para cada capa aprendemos con los resultados de la capa anterior
    if (layerHi != null) {
      layerHi[0].learn(layerIn.getResults());

      for (int i = 1; i < layerHi.length; i++) {

        layerHi[i].learn(layerHi[i-1].getResults());
      }

      layerOut.learn(layerHi[layerHi.length -1].getResults());
    } else {
      layerOut.learn(layerIn.getResults());
    }
  }

  public float[][] getResults() {

    float[][] copy = new float[results.length][results[0].length];

    arrayCopy(results, copy);

    return copy;
  }
}
