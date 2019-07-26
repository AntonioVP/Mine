int[][] tabla;
int[] array1 = {2, 2, 2};
int[] array2 = {2, 2, 2};

void setup() {
  tabla = new int[3][2];

  tabla[0] = array1;
  tabla[1] = array2;

  println(array1[0] == array2[0]);
}

void draw() {
}
