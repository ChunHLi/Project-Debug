class Unit{
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(4,4);
  int HP;
  int radius;
  Unit(){
    position.set(0,0);
    velocity.set(10,10);
    HP = 1;
    radius = 10;
  }

  void display(){
    stroke(25);
    fill(250);
    ellipse(position.x, position.y, radius*2, radius*2);
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
    if (position.x > width - radius || position.x < 0){
      velocity.x = velocity.x*-1;
    }
    else if (position.y > height - radius || position.y < 0){
      velocity.y = velocity.y*-1;
    }
    position.x += velocity.x;
    position.y += velocity.y;
    background(103);
  }
}
