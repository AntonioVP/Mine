class Capa {

  Neurona[] n;
  int[] result;

  Capa(int tam, int entradas) {
    this.n = new Neurona[tam];
    this.result = new int[tam];
    inicializaNeuronas(entradas);
  }

  
  int[] a(int[] entradas){
    
    for(int i = 0; i < this.n.length; i++){
      this.result[i] = n[i].a(entradas);
    }
    
    return this.result;
  }
  
  void inicializaNeuronas(int entradas) {
    for (int i = 0; i < this.n.length; i++) {
      n[i] = new Neurona(entradas);
    }
  }
}
