public class Vertice {

  private PVector pos;

  Vertice(float x, float y, float z) {

    this.pos = new PVector(x, y, z);
  }

  void mover() {
    float rotX = -(mouseX - pmouseX)*vel;
    float rotY = -(mouseY - pmouseY)*vel;

    pos.rotate(rotX);

    PVector aux = new PVector(pos.y, pos.z);

    aux.rotate(rotY);

    this.pos = new PVector(pos.x, aux.x, aux.y);
  }
}
