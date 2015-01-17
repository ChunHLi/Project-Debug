class Unit{
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(3,3);
  int HP;
  int radius;
  Unit(){
    position.set(0,0);
    velocity.set(5,2.5);
    HP = 3;
    radius = 10;
  }

  void display(){
    stroke(25);
    fill(250);
    ellipse(position.x,position.y, radius * 2, radius * 2);
  }
  void setHP(int newHP){
    HP = newHP;
  }
  void setRadius(int newRadius){
    radius = newRadius;
  }
  boolean checkBoundaryCollision(Unit other){
    boolean check = false;
    if (sqrt((sq(position.x - other.position.x)) + (sq(position.y - other.position.y))) < (radius + other.radius)){
      check = true;
    }
    return check;
  }
  void move(){
    if (position.x + 15 > width/2 || position.x < 0){
      velocity.x = velocity.x*-1;
    }
    else if (position.y + 15 > 3*height/4 || position.y < 0){
      velocity.y = velocity.y*-1;
    }
    position.x += velocity.x;
    position.y += velocity.y;
    //background(103);
  }
}
