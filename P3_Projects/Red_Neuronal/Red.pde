class Red {

  Neurona n;
  int[] entrada1;
  int[] entrada2;
  int[] salida;

  Red(Neurona n, String entrada1, String entrada2, String salida) {
    this.n = n;
    creaTabla(entrada1, entrada2, salida);
  }

  //Esta funcion entrena a la red 
  void entrena(int[] entradas) {
    n.aprende(entradas, target(entradas));
  }

  //Esta funcion muestra la salida correcta
  int target(int[] entradas) {
    int result = 0;
    for (int i = 0; i < this.entrada1.length; i++) {
      if (entradas[0] == entrada1[i] && entradas[1] == entrada2[i]) {
        result = i;
        break;
      }
    }
    return salida[result];
  }

  //Crea la tabla de aprendizaje
  void creaTabla(String ent1, String ent2, String sal) {

    String[] separado1 = split(ent1, ",");
    String[] separado2 = split(ent2, ",");
    String[] separado3 = split(sal, ",");

    this.entrada1 = new int[separado1.length];
    this.entrada2 = new int[separado2.length];
    this.salida = new int[separado3.length];

    for (int i = 0; i < separado1.length; i++) {
      this.entrada1[i] = int(separado1[i]);
      this.entrada2[i] = int(separado2[i]);
      this.salida[i] = int(separado3[i]);
    }
  }
}
