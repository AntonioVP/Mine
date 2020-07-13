public class Cara {

  private Vertice[] vertices = new Vertice[4];
  private int longLado;
  private PVector centro;
  private PVector ori;


  Cara(int longLado, PVector centro, PVector ori) {

    this.longLado = longLado;
    this.centro = centro;
    this.ori = ori;

    crearVertices();
  }

  void mover(){
    for(Vertice v:vertices){
      v.mover();
    }
  }
  
  void crearVertices() {
    Vertice uno = null, dos = null, tres = null, cuatro = null;

    if (ori.x == 1) {
      uno = new Vertice(centro.x, longLado/2 + centro.y, longLado/2 + centro.z);
      dos = new Vertice(centro.x, longLado/2 + centro.y, -longLado/2 + centro.z);
      tres = new Vertice(centro.x, -longLado/2 + centro.y, -longLado/2 + centro.z);
      cuatro = new Vertice(centro.x, -longLado/2 + centro.y, longLado/2 + centro.z);
    } else if (ori.y == 1) {
      uno = new Vertice(-longLado/2+centro.x, centro.y, longLado/2 + centro.z);
      dos = new Vertice( longLado/2+centro.x, centro.y, longLado/2 + centro.z);
      tres = new Vertice(longLado/2+centro.x, centro.y, -longLado/2 + centro.z);
      cuatro = new Vertice(-longLado/2+centro.x, centro.y, -longLado/2 + centro.z);
    } else if (ori.z == 1) {
      uno = new Vertice(-longLado/2+centro.x, -longLado/2 + centro.y, centro.z);
      dos = new Vertice(longLado/2+centro.x, -longLado/2 + centro.y, centro.z);
      tres = new Vertice(longLado/2+centro.x, longLado/2 + centro.y, centro.z);
      cuatro = new Vertice(-longLado/2+centro.x, longLado/2 + centro.y, centro.z);
    }

    this.vertices[0] = uno;
    this.vertices[1] = dos;
    this.vertices[2] = tres;
    this.vertices[3] = cuatro;
  }

  void show() {

    beginShape();
    vertex(vertices[0].pos.x, vertices[0].pos.y, vertices[0].pos.z);
    vertex(vertices[1].pos.x, vertices[1].pos.y, vertices[1].pos.z);
    vertex(vertices[2].pos.x, vertices[2].pos.y, vertices[2].pos.z);
    vertex(vertices[3].pos.x, vertices[3].pos.y, vertices[3].pos.z);
    endShape(CLOSE);
  }
}
