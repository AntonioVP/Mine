String data;
XML xml;

void setup() {

  data = "<data><name>New Neural Net</name></data>";
  xml = parseXML(data);

  println(xml);

  println("Editando...");

  XML newData = xml.addChild("inData");
  //newData.setName("otro");

  newData.setContent("0.0");

  println(xml);
}

void draw() {
  background(255);
}
