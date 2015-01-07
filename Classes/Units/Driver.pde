Unit Test;
void setup(){
  frameRate(60);
  size(640,320);
  smooth();
  background(103);
  Test = new Unit();
}
void draw(){
  Test.move();
  Test.display();
}
  
  
