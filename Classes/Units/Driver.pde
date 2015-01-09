Unit Test;
Player Test2;
void setup(){
  frameRate(60);
  size(640,320);
  smooth();
  background(103);
  Test = new Unit();
  Test2 = new Player();
}
void draw(){
  Test.move();
  Test.display();
  Test2.keyPressed();
  Test2.move();
  Test2.display();
  Test2.keyReleased();
}
  
  
