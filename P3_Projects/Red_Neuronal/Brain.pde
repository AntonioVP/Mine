class Brain { //<>// //<>// //<>// //<>// //<>//

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
  void train(Net r) {
    float error = 1;

    //Aqui hacer entrenamiento hasta que el error sea menor que 0.001.
    while (error > 0.001) {

      //Empezamos a entrenar la red con cada valor de la tabla de entrenamiento.
      for (int i = 0; i < x.length; i++) {

        //Obtenemos los errores de la red.
        r.a(x[i]); //<>//
        setErrors(r, this.y[i]); //<>//

        //Entrenamos la red con los errores calculados.
        r.learn(); //<>//
      }

      error = abs(errors[errors.length - 1][0]);

      println("El error ahora es de " + error);
      println();
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
          //Para cada neurona de la capa siguiente a la actual
          float sum = 0.0;

          //Hacemos el sumatorio de los pesos que van de la neurona actual J por el error de cada neurona de la capa K donde K es l+1.
          // Sum(wjk * error(k))
          for (int k = 0; k < r.layers[l+1].n.length; k++) {
            sum += r.layers[l+1].n[k].w[j] * errors[l+1][k];
          }

          this.errors[l][j] = a*(1.0 - a)*(sum);
          r.layers[l].n[j].outputError = this.errors[l][i];
        }
      }
    }
  }
}
