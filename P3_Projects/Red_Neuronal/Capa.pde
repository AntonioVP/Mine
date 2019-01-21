class Capa {

  Neurona[] n;
  int capa;

  Capa(int tam, int capa, int entradas) {
    this.n = new Neurona[tam];
    this.capa = capa;
    inicializaNeuronas(entradas);
  }


  void inicializaNeuronas(int entradas) {
    for (int i = 0; i < this.n.length; i++) {
      n[i] = new Neurona(entradas);
    }
  }
}
