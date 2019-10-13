class Text {

  String tx;
  int x;
  int y;
  int tam;

  boolean noSlash = true;

  Text(String t, int x, int y, int tam) {
    this.tx = t;
    this.x = x;
    this.y = -y;
    this.tam = tam;
  }

  void show() {

    fill(0);
    textSize(this.tam);
    text(this.tx, this.x, this.y);
  }

  void show(String otro) {

    fill(0);
    textSize(this.tam);
    text(otro, this.x, this.y);
  }

  void showWithSlash() {

    float offset = this.tam * 0.9 * (this.tx.length()) / 2.6;

    if (frameCount % 25 == 0) {
      noSlash = !noSlash;
    }
    
    this.show();
    if (!noSlash) {
      text("|", this.x + offset, this.y);
    }
  }

  void borra() {
    if (this.tx.length() > 1) {
      this.tx = this.tx.substring(0, this.tx.length() - 1);
    } else {
      this.tx = "";
    }
  }
}
