class Population {
  Dot[] dots;
  float fitSum;
  int gen = 1;

  int bestDot = 0;
  int minStep = 400;

  Population(int tam) {
    dots = new Dot[tam];

    for (int i = 0; i < tam; i++) {
      dots[i] = new Dot();
    }
  }

  //--------------------------------------------------------------------------------
  void show() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].show();
    }

    dots[0].show();
  }


  //--------------------------------------------------------------------------------
  void update() {
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].brain.step > minStep) {
        dots[i].dead = true;
      } else {
        dots[i].update();
      }
    }
  }


  //--------------------------------------------------------------------------------
  void calculateFit() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].calculateFit();
    }
  }


  //--------------------------------------------------------------------------------

  boolean allDotsDead() {
    for (int i = 0; i < dots.length; i++) {
      if (!dots[i].dead && !dots[i].rearchedGoal) {
        return false;
      }
    }

    return true;
  }

  //--------------------------------------------------------------------------------

  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    setBestDot();
    calculateFitSum();

    newDots[0] = dots[bestDot].crearBaby();
    newDots[0].isBest = true;
    for (int i = 1; i < newDots.length; i++) {

      //Seleccionar los padres segun el fitness
      Dot padre = selectParent();

      //Conseguir el nuevo miembro de los padres
      newDots[i] = padre.crearBaby();
    }

    dots = newDots.clone();
    gen++;
  }

  //--------------------------------------------------------------------------------
  void calculateFitSum() {
    fitSum = 0;
    for (int i = 0; i < dots.length; i++) {
      fitSum += dots[i].fit;
    }
  }

  //--------------------------------------------------------------------------------
  Dot selectParent() {
    float rand = random(fitSum);

    float runningSum = 0;

    for (int i = 0; i < dots.length; i++) {
      runningSum += dots[i].fit;
      if (runningSum > rand) {
        return dots[i];
      }
    }

    //Nunca deberia de llegar a este punto
    return null;
  }

  //--------------------------------------------------------------------------------

  void mutateDemBabies() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].brain.mutate();
    }
  }

  //--------------------------------------------------------------------------------

  void setBestDot() {
    float max = 0;
    int maxIndex = 0;

    for (int i = 0; i < dots.length; i++) {
      if (dots[i].fit > max) {
        max = dots[i].fit;
        maxIndex = i;
      }
    }

    bestDot = maxIndex;

    if (dots[bestDot].rearchedGoal) {
      minStep = dots[bestDot].brain.step;
      println("Pasos: ", minStep);
    }
  }

  //--------------------------------------------------------------------------------
}
