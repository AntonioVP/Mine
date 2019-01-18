class Brain {

  Perceptron p;
  String tipo;


  Brain(Perceptron p, String tipo) {
    this.p = p;
    this.tipo = tipo;
  }


  void entrena(int[] entradas) {

    p.aprende(entradas, target(entradas));
  }

  int target(int[] entradas) {

    if (tipo == "OR") {

      return entradas[0] == 1 || entradas[1] == 1? 1:0;
    } else if (tipo == "AND") {
      return entradas[0] == 1 && entradas[1] == 1? 1:0;
    } else {
      return 0;
    }
  }
}
