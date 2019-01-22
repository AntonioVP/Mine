class Brain {

  int[][] x;
  int[][] y;



  Brain (String[] x, String[] y) {
    createXandY(x, y);
  }


  void train(Red r) {
    int[] in = new int[x[0].length];
    for (int i = 0; i < x.length; i++) {
      for (int j = 0; j < x[0].length; j++) {
        in[j] = x[i][j];
      }
      if (r.a(in) != y[i]) {
        r.train(in, y[i]);
      }
    }
  }


  void createXandY(String[] xList, String[] yList) {
    String[] atri = split(xList[0], ',');

    this.x = new int[x.length][atri.length];

    for (int i = 0; i < x.length; i++) {
      atri = split(xList[i], ',');
      for (int j = 0; j < atri.length; j++) {
        this.x[i][j] = int(atri[j]);
      }
    }

    this.y = new int[yList.length][1];

    for (int i = 0; i < yList.length; i++) {
      this.y[i][1] = int(yList[i]);
    }
  }
}
