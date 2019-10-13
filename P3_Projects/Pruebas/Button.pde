class Button {

  String id;
  int x;
  int y;
  int w;
  int h;
  color c;
  Text t;

  Button(String id, int x, int y, int w, int h, color c) {
    this.id = id;
    this.x = x;
    this.y = -y;
    this.w = w;
    this.h = h;
    this.c = c;
  }

  Button(String id, int x, int y, int w, int h, color c, String tx, int tamText) {
    this.id = id;
    this.x = x;
    this.y = -y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.t = new Text(tx, x, y, tamText);
  }

  Button(String id, int x, int y, int w, color c) {
    this.id = id;
    this.x = x;
    this.y = -y;
    this.w = w;
    this.h = w;
    this.c = c;
  }

  Button(String id, int x, int y, int w, color c, String tx, int tamText) {
    this.id = id;
    this.x = x;
    this.y = -y;
    this.w = w;
    this.h = w;
    this.c = c;
    this.t = new Text(tx, x, y, tamText);
  }

  boolean hit(int mX, int mY) {
    float mx = map(mX, 0, width, -width/2, width/2);
    float my = map(mY, 0, height, -height/2, height/2);

    return (mx > (this.x - this.w) && mx < (this.x + this.w) && my < (this.y + this.h) && my > (this.y - this.h));
  }

  void show() {

    fill(c);
    rect(x, y, w*2, h*2);
  }

  void showAll() {
    fill(c);
    rect(x, y, w*2, h*2);

    if (t != null) {
      t.show();
    }
  }
}
