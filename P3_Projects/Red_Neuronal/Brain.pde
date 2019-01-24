class Brain {

  float[][] x;
  float[][] y;
  float[][] errors;


  Brain (String[] x, String[] y) {
    createXandY(x, y);
  }


  //Crea la tabla de entrenamiento segun los archivos cargados.
  void createXandY(String[] xList, String[] yList) {
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
  float[] output(float[] input) {
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
  void train(Red r) {
    float error = 1;

    //Aqui hacer entrenamiento hasta que el error sea menor que 0.01.
    while (error > 0.0001) { //<>//

      //Empezamos a entrenar la red con cada valor de la tabla de entrenamiento.
      for (int i = 0; i < x.length; i++) {

        //Obtenemos los errores de cada salida de la red.
        r.a(x[i]);
        getErrors(r, this.y[i]);

        //Entrenamos la red con la entrada y salida esperada y con los errores calculados.
        r.train(errors);
      }

      error = abs(errors[errors.length - 1][0]); //<>//
    }
  }

  //Aqui obtenemos los errores de la red neuronal r con las entradas x para la salida esperada y.
  private void getErrors(Red r, float[] y) {

    this.errors = r.results;

    for (int i = 0; i < errors.length; i++) {

      // l sera la capa donde nos encontramos actualmente
      int l = errors.length - (i+1);

      for (int j = 0; j < errors[l].length; j++) {

        float a = r.results[l][j];

        if (i == 0) {
          this.errors[l][j] = a*(1.0 - a)*(y[j] - a);
        } else {
          //Para cada neurona de la capa siguiente a la actual
          float sum = 0.0;

          //Hacemos el sumatorio de los pesos que van de la neurona actual J por el error de cada neurona de la capa K donde K es l+1.
          // Sum(wjk * error(k))
          for (int k = 0; k < r.layers[l+1].n.length; k++) {
            sum += r.layers[l+1].n[k].w[j] * errors[l+1][k];
          }

          this.errors[l][i] = a*(1.0 - a)*(sum);
        }
      }
    }
  }
}
