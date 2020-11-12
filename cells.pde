class cell{

  final float MAX_DIAM = 120;

  final float MAX_DEPTH = (width + height) / 4;

  final float SCALE = MAX_DEPTH;

  PVector worldPosition, screenPosition, viewPosition;

  float diam;

  cell(){
 
    worldPosition = new PVector(random(0, width), random(0, height), random(0, MAX_DEPTH));
    viewPosition = new PVector();
  }
  
  void move(float speed){
     worldPosition.z -= speed;

     worldPosition.z = constrain(worldPosition.z, 0, MAX_DEPTH);
  }
  
  void transform(PVector endpoint){

      viewPosition.x = (worldPosition.x - endpoint.x) / worldPosition.z * SCALE;
      viewPosition.y = (worldPosition.y - endpoint.y) / worldPosition.z * SCALE;

    screenPosition = PVector.add(endpoint, viewPosition);

    diam = map(worldPosition.z, 0, MAX_DEPTH, MAX_DIAM, 0);
  }
  
  void checkEdge(){
    if(screenPosition.x <= 0 || screenPosition.x >= width || screenPosition.y <=0 || screenPosition.y >= height){

      worldPosition.set(random(0, width), random(0, height), MAX_DEPTH); 
    } 
  }
 
  void display(){

    fill(#F56589,200);
    noStroke();
    ellipse(screenPosition.x, screenPosition.y, diam, diam);
    stroke(0);
    strokeWeight(20);
    line(screenPosition.x, screenPosition.y,screenPosition.x, screenPosition.y);
  }
  
}
