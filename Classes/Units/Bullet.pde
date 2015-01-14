class Bullet extends Unit{
  boolean EdgeOfScreen;
  int power;
  
  Bullet(){
    setPower(10);
  }
  
  void setPower(int newPower){
    power = newPower;
  }
  
  void setEdgeOfScreen(boolean newBoolean){
    EdgeOfScreen = newBoolean;
  }
  
  void display(){
    stroke(153);
    ellipse(position.x,position.y,100,200);
  }
}
