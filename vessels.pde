class vessels{

  final int cells_COUNT = width / 2;

  final int MAX_SPEED = 15, MIN_SPEED = 1;
  final int SPEED_STEP = 1;

  ArrayList<cell> cells;

  PVector endpoint;

  int speed ;
  
  vessels(){

    endpoint = new PVector(mouseX, mouseY);

    cells = new ArrayList<cell>();
    for(int i = 0; i < cells_COUNT; i++){
      cells.add(new cell());
    }

    speed = 3;
  }

  
  void run(){
   for(cell s : cells){

     s.move(speed);

     s.transform(endpoint);

     s.checkEdge();

     s.display();
   }
  }
  
  void updateEndpoint(float x, float y){
    endpoint.x = x;
    endpoint.y = y;
  }
  
}
