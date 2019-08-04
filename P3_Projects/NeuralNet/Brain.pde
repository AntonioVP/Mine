class Brain { //<>// //<>// //<>// //<>//

  float[][] x;
  float[][] y;
  float[][] errors;


  Brain (String[] x, String[] y) {
    createXandY(x, y);
  }


  //Crea la tabla de entrenamiento segun los archivos cargados.
  private void createXandY(String[] xList, String[] yList) {
    String[] atri = split(xList[0], ',');

    this.x = new float[xList.length][atri.length];

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


  //Busca en la tabla el resultado de la entrada input.
  public float[] output(float[] input) {
    float[] result = {-1};

    for (int i = 0; i < this.x.length; i++) {

      boolean equal = true;

      for (int j = 0; j < input.length; j++) {
        if (this.x[i][j] != input[j]) {
          equal = false;
        }
      }

      if (equal) {
        return y[i];
      }
    }

    return result;
  }


  //Entrena la red con la tabla de entrenamiento que tiene Brain.
  public void train(Net r) {
    float error = 1;

    while (error > 0.001) {

      //Entrenamos la red con la tabla de entrenamiento.
      for (int i = 0; i < x.length; i++) {

        //Calculamos la salida de cada unidad y vamos propagando hacia adelante.
        r.a(x[i]);

        //Calculamos los errores de la red.
        this.setErrors(r, this.y[i]);

        //Actualizamos los pesos propagando los valores hacia detras.
        r.learn(x[i]);
      }

      float sum = 0.0;

      for (int i = 0; i < y.length; i++) {
        r.a(x[i]);
        for (int j = 0; j < y[i].length; j++) {
          sum += abs(y[i][j] - r.getResults()[r.getResults().length - 1][j]) / 4;
        }
      }

      error = sum; //<>//
    }
  }

  //Aqui obtenemos los errores de la red neuronal r con las entradas x para la salida esperada y.
  private void setErrors(Net r, float[] y) {

    this.errors = r.getResults();

    for (int i = 0; i < errors.length; i++) {

      // l sera la capa donde nos encontramos actualmente
      int l = this.errors.length - (i+1);

      // j sera la neurona en la que nos encontramos actualmente
      for (int j = 0; j < this.errors[l].length; j++) {

        float a =  r.getResults()[l][j];

        if (i == 0) {
          this.errors[l][j] = a*(1.0 - a)*(y[j] - a);
          r.layers[l].n[j].outputError = this.errors[l][j];
        } else {
          //Para cada neurona desde la penultima a la primera
          float sum = 0.0;

          //Hacemos el sumatorio de los pesos relacionados con la neurona actual J con la capa de un nivel mayor (K donde K es l+1) por el error de las neuronas de K
          //Sum(wjk * error(k))
          for (int k = 0; k < r.layers[l+1].n.length; k++) {
            sum += r.layers[l+1].n[k].w[j] * this.errors[l+1][k];
          }

          this.errors[l][j] = a*(1.0 - a)*(sum);
          r.layers[l].n[j].outputError = this.errors[l][i];
        }
      }
    }
  }
}
