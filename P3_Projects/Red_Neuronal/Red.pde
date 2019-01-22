class Red {

  Neurona n;

  Capa[] capas;
  int[][] results;
  float fa = 0.01;

  //Estas son para la tabla de aprendizaje
  int[] tabla1;
  int[] tabla2;
  int[] tablaResult;


  Red(Neurona n, String tabla1, String tabla2, String tablaResult) {
    this.n = n;
    creaTabla(tabla1, tabla2, tablaResult);
  }


  Red(int[] neuronasPorCapas, int[] entradas) {
    capas = new Capa[neuronasPorCapas.length];
    for (int i = 0; i < neuronasPorCapas.length; i++) {
      if (i == 0) {
        capas[i] = new Capa(neuronasPorCapas[i], entradas.length);
      } else {
        capas[i] = new Capa(neuronasPorCapas[i], neuronasPorCapas[i-1]);
      }
    }
  }


  //Da el resultado de la red al introducir los valores de entrada
  int[] a(int[] entradas) {
    int[] a = entradas;
    int[] _a;

    for (int i = 0; i < capas.length; i++) {
      _a = capas[i].a(a);

      a = _a;
    }

    return a;
  }


  //Esta funcion entrena a la red 
  void entrena(int[] entradas) {
    n.aprende(entradas, target(entradas));

    for (int i = 0; i < capas.length; i++) {
    }
  }


  //Esta funcion muestra la salida correcta segun la tabla de aprendizaje (¿mover a otra clase la tabla (clae Brain)?)
  int target(int[] entradas) {
    int result = 0;
    for (int i = 0; i < this.tabla1.length; i++) {
      if (entradas[0] == tabla1[i] && entradas[1] == tabla2[i]) {
        result = i;
        break;
      }
    }
    return tablaResult[result];
  }

  //Crea la tabla de aprendizaje
  void creaTabla(String ent1, String ent2, String sal) {

    String[] separado1 = split(ent1, ",");
    String[] separado2 = split(ent2, ",");
    String[] separado3 = split(sal, ",");

    this.tabla1 = new int[separado1.length];
    this.tabla2 = new int[separado2.length];
    this.tablaResult = new int[separado3.length];

    for (int i = 0; i < separado1.length; i++) {
      this.tabla1[i] = int(separado1[i]);
      this.tabla2[i] = int(separado2[i]);
      this.tablaResult[i] = int(separado3[i]);
    }
  }
}
