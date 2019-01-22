class Capa {

  Neurona[] n;
  int[] results;

  Capa(int len, int x) {
    this.n = new Neurona[len];
    this.results = new int[len];
    createNeurons(x);
  }

  //Resultados de la capa con las entradas proporcionadas
  int[] a(int[] x){
    
    for(int i = 0; i < this.n.length; i++){
      this.results[i] = n[i].a(x);
    }
    
    return this.results;
  }
  
  void createNeurons(int x) {
    for (int i = 0; i < this.n.length; i++) {
      n[i] = new Neurona(x);
    }
  }
}
