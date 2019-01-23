class Brain {

  float[][] x;
  float[][] y;



  Brain (String[] x, String[] y) {
    createXandY(x, y);
  }

  //Busca en la tabla el resultado de la entrada input
  float[] output(float[] input) {
    float[] result = {-1};

    for (int i = 0; i < input.length; i++) {
      if (x[i] == input) {
        result = y[i];
      }
    }

    return result;
  }

  //Entrena la red con la tabla de entrenamiento que tiene brain
  void train(Red r) {
    float[] in = new float[x[0].length];
    for (int i = 0; i < x.length; i++) {
      for (int j = 0; j < x[0].length; j++) {
        in[j] = x[i][j];
      }
      
      //Aqui hacer que hasta que el error no sea menor que 0.99 siga entrenando
      
    }
  }


  void createXandY(String[] xList, String[] yList) {
    String[] atri = split(xList[0], ',');

    this.x = new float[x.length][atri.length];

    for (int i = 0; i < x.length; i++) {
      atri = split(xList[i], ',');
      for (int j = 0; j < atri.length; j++) {
        this.x[i][j] = float(atri[j]);
      }
    }

    this.y = new float[yList.length][1];

    for (int i = 0; i < yList.length; i++) {
      this.y[i][0] = float(yList[i]);
    }
  }
}
