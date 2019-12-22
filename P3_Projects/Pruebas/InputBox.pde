class InputBox {

  String id;

  boolean focus;
  ;

  Button box;

  InputBox(String id, int x, int y, int w, int h, int tam) {
    box = new Button(id, x, y, w, h, color(255), tam);
    focus = false;
  }
  
  String getInput(){
    return box.t.tx;
  }
  
  boolean hit(int x, int y) {
    return box.hit(x, y);
  }

  void write(String w) {
    box.t.tx += w;
  }
  
  void write(char w) {
    box.t.tx += w;
  }

  void borra() {
    box.t.borra();
  }
  
  void clear(){
    box.t.tx = "";
  }

  void show() {

    if (!focus) {
      box.showAll();
    } else {

      box.show();
      box.t.showWithSlash();
    }
  }
}
