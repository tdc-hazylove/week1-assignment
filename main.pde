vessels sf;
void setup(){
  size(1000, 1000);
  sf = new vessels();
}

void draw(){
  background(#673A45);

  sf.run();
}
