class Bullet extends Unit{
  boolean EdgeOfScreen;
  
  Bullet(){
  }
  
  void setEdgeOfScreen(boolean newBoolean){
    EdgeOfScreen = newBoolean;
  }
  
  void display(){
    stroke(153);
    ellipse(position.x,position.y,10,20);
  }
}
