int[][] tabla;
int[] array1 = {2, 2, 2};
int[] array2 = {4, 4};

void setup() {
  tabla = new int[3][2];

  tabla[0] = array1;
  tabla[1] = array2;

  for (int i = 0; i < tabla.length; i++) {
    for (int j = 0; j < tabla[i].length; j++) {
      print(tabla[i][j] + "     ");
    }
    println();
  }
}

void draw() {
}
