public class Caja {

  private PVector centro;
  private Cara[] caras = new Cara[6];
  private int radio;

  Caja( int radio, PVector centro) {

    this.centro = centro;
    this.radio = radio;

    crearCaras();
  }

  void mover() {
    for (Cara c : caras) {
      c.mover();
    }
  }

  void crearCaras() {
    PVector ori = new PVector(0, 0, 0);
    PVector aux = centro.copy();

    //Orientacion X
    ori.x = 1;

    aux.x += radio;
    caras[0] = new Cara(radio*2, aux, ori);

    aux = centro.copy();

    aux.x -= radio; 
    caras[1] = new Cara(radio*2, aux, ori);

    ori.x = 0;

    //Orientacion Y
    ori.y = 1;

    aux = centro.copy();

    aux.y += radio;
    caras[2] = new Cara(radio*2, aux, ori);

    aux = centro.copy();

    aux.y -= radio; 
    caras[3] = new Cara(radio*2, aux, ori);

    ori.y = 0;

    //Orientacion Z
    ori.z = 1;

    aux = centro.copy();

    aux.z += radio;
    caras[4] = new Cara(radio*2, aux, ori);

    aux = centro.copy();

    aux.z -= radio; 
    caras[5] = new Cara(radio*2, aux, ori);

    ori.z = 0;
  }

  void show() {

    pushMatrix();
    //Cara Verde
    fill(0, 255, 0);
    caras[0].show();

    //Cara Azul
    fill(0, 0, 255);
    caras[1].show();

    //Cara Roja
    fill(255, 0, 0);
    caras[2].show();

    //Cara Naranja
    fill(255, 125, 0);
    caras[3].show();

    //Cara Amarilla
    fill(255, 255, 0);
    caras[4].show();

    //Cara Blanca
    fill(255, 255, 255);
    caras[5].show();

    popMatrix();
  }
}
