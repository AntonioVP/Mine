class Brain {
  PVector[] dir;
  int step = 0;

  Brain(int tam) {
    dir = new PVector[tam];
    randomize();
  }

  //--------------------------------------------------------------------------------
  void randomize() {
    for (int i = 0; i < dir.length; i++) {
      float randomAngle = random(2*PI);
      dir[i] = PVector.fromAngle(randomAngle);
    }
  }

  //--------------------------------------------------------------------------------
  Brain clone() {
    Brain clone = new Brain(dir.length);

    for (int i = 0; i < dir.length; i++) {
      clone.dir[i] = dir[i].copy();
    }

    return clone;
  }

  //--------------------------------------------------------------------------------
  void mutate() {
    float mutationRate = 0.01;

    for (int i = 0; i < dir.length; i++) {
      float rand = random(1);

      if (rand < mutationRate) {
        //Cambiar la direccion como una direccion aleatoria
        float randomAngle = random(2*PI);
        dir[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
  //--------------------------------------------------------------------------------
}
