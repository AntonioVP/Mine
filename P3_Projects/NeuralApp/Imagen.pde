class Imagen {

  String id;
  int x;
  int y;
  int w;
  int h;
  
  PImage img;

  Imagen(String id, PImage img, int x, int y, int w, int h) {
    
     this.id = id;
    this.x = x;
    this.y = -y;
    this.w = h; //h y w estan invertidos en la funcion image, por eso lo guardo asi
    this.h = w;
    this.img = img;
  }
  
  void show(){
    
    image(this.img, x, y, h, w);
  }
}
