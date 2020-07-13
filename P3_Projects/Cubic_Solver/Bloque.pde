class Bloque {

  PVector  pos;
  int nivel;
  float ref = tam/2;

  float[] uno =   new float[3];
  float[] dos =   new float[3];
  float[] tres =   new float[3];
  float[] cuatro =   new float[3];
  float[] cinco =   new float[3];
  float[] seis =   new float[3];
  float[] siete =   new float[3];
  float[] ocho =   new float[3];

  float[][] vertices = {uno, dos, tres, cuatro, cinco, seis, siete, ocho};

  float desAlfa;
  float desBeta;

  Bloque(PVector posi, int lvl) {
    this.pos = posi;
    this.nivel = lvl;

    crearVertices();
  }


  //-----------------------------------------------------
  void show() {

    stroke(0);

    //Atras
    if (pos.z == (nivel - 1)) {
      fill(255, 128, 0);
    } else {
      fill(0);
    }
    beginShape();
    vertex(cinco[0], cinco[1], cinco[2]);
    vertex(seis[0], seis[1], seis[2]);
    vertex(siete[0], siete[1], siete[2]);
    vertex(ocho[0], ocho[1], ocho[2]);
    endShape(CLOSE);

    //Derecha
    if (pos.x == (nivel - 1)) {
      fill(0, 255, 0);
    } else {
      fill(0);
    }
    beginShape();
    vertex(dos[0], dos[1], dos[2]);
    vertex(seis[0], seis[1], seis[2]);
    vertex(siete[0], siete[1], siete[2]);
    vertex(tres[0], tres[1], tres[2]);
    endShape(CLOSE);

    //Izquierda
    if (pos.x == 0) {
      fill(0, 0, 255);
    } else {
      fill(0);
    }
    beginShape();
    vertex(uno[0], uno[1], uno[2]);
    vertex(cinco[0], cinco[1], cinco[2]);
    vertex(ocho[0], ocho[1], ocho[2]);
    vertex(cuatro[0], cuatro[1], cuatro[2]);
    endShape(CLOSE);

    //Arriba
    if (pos.y == 0) {
      fill(255, 255, 0);
    } else {
      fill(0);
    }
    beginShape();
    vertex(uno[0], uno[1], uno[2]);
    vertex(dos[0], dos[1], dos[2]);
    vertex(seis[0], seis[1], seis[2]);
    vertex(cinco[0], cinco[1], cinco[2]);
    endShape(CLOSE);

    //Abajo
    if (pos.y == (nivel - 1)) {
      fill(255);
    } else {
      fill(0);
    }
    beginShape();
    vertex(cuatro[0], cuatro[1], cuatro[2]);
    vertex(ocho[0], ocho[1], ocho[2]);
    vertex(siete[0], siete[1], siete[2]);
    vertex(tres[0], tres[1], tres[2]);
    endShape(CLOSE);

    //Frente
    if (pos.z == 0) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    //ellipse(uno[0], uno[1], 10, 10);
    beginShape();
    vertex(uno[0], uno[1], uno[2]);
    vertex(dos[0], dos[1], dos[2]);
    vertex(tres[0], tres[1], tres[2]);
    vertex(cuatro[0], cuatro[1], cuatro[2]);
    endShape(CLOSE);
  }

  //-----------------------------------------------------
  void crearVertices() {
    uno =    addVertice(-1, -1, -1);
    dos =    addVertice(+1, -1, -1);
    tres =   addVertice(+1, +1, -1);
    cuatro = addVertice(-1, +1, -1);

    cinco =  addVertice(-1, -1, +1);
    seis =   addVertice(+1, -1, +1);
    siete =  addVertice(+1, +1, +1);
    ocho =   addVertice(-1, +1, +1);
  }

  //-----------------------------------------------------
  float[] addVertice(int x, int y, int z) {

    float[] vertice = new float[3];

    float posX = x==-1? (-ref + tam*pos.x/ nivel) : (-ref + (pos.x + 1)*tam / nivel);
    float posY = y==-1? (-ref + tam*pos.y/ nivel) : (-ref + (pos.y + 1)*tam / nivel);
    float posZ = z==-1? (ref - tam*pos.z/ nivel) : (ref - (pos.z + 1)*tam / nivel);

    vertice[0] = posX;
    vertice[1] = posY;
    vertice[2] = posZ;

    return vertice;
  }

  //-----------------------------------------------------
  void update(Move m) {

    float[] unoC =   uno.clone();
    float[] dosC =   dos.clone();
    float[] tresC =   tres.clone();
    float[] cuatroC =   cuatro.clone();
    float[] cincoC =   cinco.clone();
    float[] seisC =   seis.clone();
    float[] sieteC =   siete.clone();
    float[] ochoC =   ocho.clone();

    if (m == Move.F) {
      //Para F
      uno[0] = -unoC[1]; 
      uno[1] = unoC[0];

      dos[0] = -dosC[1];
      dos[1] = dosC[0];

      tres[0] = -tresC[1];
      tres[1] = tresC[0];

      cuatro[0] = -cuatroC[1];
      cuatro[1] = cuatroC[0];

      cinco[0] = -cincoC[1];
      cinco[1] = cincoC[0];

      seis[0] = -seisC[1];
      seis[1] = seisC[0];

      siete[0] = -sieteC[1];
      siete[1] = sieteC[0];

      ocho[0] = -ochoC[1];
      ocho[1] = ochoC[0];
    } else if (m == Move.Fp) {
      //Para Fp
      uno[0] = unoC[1]; 
      uno[1] = -unoC[0];

      dos[0] = dosC[1];
      dos[1] = -dosC[0];

      tres[0] = tresC[1];
      tres[1] = -tresC[0];

      cuatro[0] = cuatroC[1];
      cuatro[1] = -cuatroC[0];

      cinco[0] = cincoC[1];
      cinco[1] = -cincoC[0];

      seis[0] = seisC[1];
      seis[1] = -seisC[0];

      siete[0] = sieteC[1];
      siete[1] = -sieteC[0];

      ocho[0] = ochoC[1];
      ocho[1] = -ochoC[0];
    } else if (m == Move.B) {
      //Para B
      uno[0] = unoC[1]; 
      uno[1] = -unoC[0];

      dos[0] = dosC[1];
      dos[1] = -dosC[0];

      tres[0] = tresC[1];
      tres[1] = -tresC[0];

      cuatro[0] = cuatroC[1];
      cuatro[1] = -cuatroC[0];

      cinco[0] = cincoC[1];
      cinco[1] = -cincoC[0];

      seis[0] = seisC[1];
      seis[1] = -seisC[0];

      siete[0] = sieteC[1];
      siete[1] = -sieteC[0];

      ocho[0] = ochoC[1];
      ocho[1] = -ochoC[0];
    } else if (m == Move.Bp) {
      //Para Bp
      uno[0] = -unoC[1]; 
      uno[1] = unoC[0];

      dos[0] = -dosC[1];
      dos[1] = dosC[0];

      tres[0] = -tresC[1];
      tres[1] = tresC[0];

      cuatro[0] = -cuatroC[1];
      cuatro[1] = cuatroC[0];

      cinco[0] = -cincoC[1];
      cinco[1] = cincoC[0];

      seis[0] = -seisC[1];
      seis[1] = seisC[0];

      siete[0] = -sieteC[1];
      siete[1] = sieteC[0];

      ocho[0] = -ochoC[1];
      ocho[1] = ochoC[0];
    }
  }

  void girar() {

    uno = updateVertice(uno);
    dos = updateVertice(dos);
    tres = updateVertice(tres);
    cuatro = updateVertice(cuatro);
    cinco = updateVertice(cinco);
    seis = updateVertice(seis);
    siete = updateVertice(siete);
    ocho = updateVertice(ocho);
  }

  float[] updateVertice(float[] viejo) {

    desAlfa = -(mouseX - pmouseX)*vel;
    desBeta = -(mouseY - pmouseY)*vel;

    PVector p1 = new PVector(viejo[0], viejo[1], viejo[2]);

    p1.rotate(desAlfa);

    PVector p2 = new PVector(p1.y, p1.z);

    p2.rotate(desBeta);

    float[] vertice = {p1.x, p2.x, p2.y};

    return vertice;
  }
}
