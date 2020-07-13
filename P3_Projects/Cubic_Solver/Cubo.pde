class Cubo {

  Bloque[][][] bloques;
  int nivel;

  Cubo(int lvl) {
    bloques = new Bloque[lvl][lvl][lvl];
    nivel = lvl;

    for (int i = 0; i < lvl; i++) {
      for (int j = 0; j < lvl; j++) {
        for (int k = 0; k < lvl; k++) {
          PVector pos = new PVector(i, j, k);
          bloques[i][j][k] = new Bloque(pos, lvl);
        }
      }
    }
  }

  //-----------------------------------------------------
  void show() {
    for (int i = 0; i < nivel; i++) {
      for (int j = 0; j < nivel; j++) {
        for (int k = 0; k < nivel; k++) {
          bloques[i][j][k].show();
        }
      }
    }
  }

  //-----------------------------------------------------
  void move(Move m) {

    //Cara de enfrente
    if (m == Move.F || m == Move.Fp) {
      for (int i = 0; i < nivel; i++) {
        for (int j = 0; j < nivel; j++) {
          bloques[i][j][0].update(m);
        }
      }
    }
    
    //Cara de atras
    if (m == Move.B || m == Move.Bp) {
      for (int i = 0; i < nivel; i++) {
        for (int j = 0; j < nivel; j++) {
          bloques[i][j][nivel-1].update(m);
        }
      }
    }
  }
  
  //-----------------------------------------------------
  void moveBlock(){
    
    for(Bloque[][] b2 : bloques){
      for(Bloque[] b1 : b2){
        for(Bloque b : b1){
          b.girar();
        }
      }
    }
  }
}
