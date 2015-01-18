class enemyShot extends Bullet{
  int eShotCounter;
  float vel;
  int display;
  int rotateCounter;
  float acceleration = .02;
  
 enemyShot(float x, float y, float nvelx, float nvely, int newEShotCounter,int displayType){
   position.x = x;
   position.y = y;
   velocity.x = nvelx;
   velocity.y = nvely;
   display = displayType;
   rotateCounter = 0;
   eShotCounter = newEShotCounter;
 }
 
  enemyShot(float x, float y, float nvel, int newEShotCounter, ArrayList<Player> whatever,int displayType){
   position.x = x;
   position.y = y;
   display = displayType;
   eShotCounter = newEShotCounter;
   if (playerList.size() > 0){
     calcVXY(whatever.get(0));
   }
   else{
     velocity.x = 10;
     velocity.y = 10;
   }
 }
  
 enemyShot(float x, float y,float nvelx,float nvely, int newEShotCounter, ArrayList<Player> whatever,int enemyType){
    position.x = x;
    position.y=y;
    vel = nvelx;
    eShotCounter = newEShotCounter;
    if (enemyType == 0 || enemyType == 2){
      if (playerList.size() > 0){
        calcVXY(whatever.get(0));
      }
      else{
        velocity.x = 10;
        velocity.y = 10;
      }
    }
    if (enemyType == 1){
      velocity.x = nvelx;
      velocity.y = nvely;
    }
 }
 
 void checkBoundaryCollision(Player other,ArrayList<enemyShot> EShotList){
   if (other.invulnTime > 0){
     other.invulnTime -= 1;
   }
   else{
     if (super.checkBoundaryCollision(other)){
       if (other.invulnTime == 0){;
         other.setHP(other.HP - 1);
         if (other.power > 80){
           other.power = 40;
         }
         else{
           other.power = other.power/2;
         }
         other.invulnTime = 9000;
         other.position.x = width/4;
         other.position.y = 2*height/3;
       }
       removeEShot(eShotCounter);
     }
   }
 }
 
 void moveBullet(){
   if (position.y + velocity.y < height && position.y + velocity.x > 0){
     position.y += velocity.y;
   }
   if (position.y + velocity.y + 10> height || position.y + velocity.x < 0){
     removeEShot(eShotCounter);
   }
   if (position.x + velocity.x + 5 <= width/2 && position.x + velocity.x > 0){
     position.x += velocity.x;
   }
   if (position.x + velocity.x + 5> width/2 || position.x + velocity.x < 0){
     removeEShot(eShotCounter);
   }
   if (display == 6){
     velocity.y += acceleration;
   }
 }
   
 void calcVXY(Player other){
   int above = 1;
   if (other.position.y <= position.y){
     above = above*-1;
   }
   float angle;
   float dx = position.x - other.position.x;
   float dy = position.y - other.position.y;
   angle = atan(dx / dy);
   velocity.x = above*(vel * sin(angle));
   velocity.y = above*(vel * cos(angle));
 }

 void display(){
   if (display == 0){  
     stroke(25);
     fill(67,4,4);
     ellipse(position.x,position.y,radius*3,radius*3);
     fill(240,8,8);
     ellipse(position.x + .5,position.y + .5, radius*2, radius*2);
   }
   if (display == 1){
     strokeWeight(3);
     stroke(0);
     fill(47,42,2);
     ellipse(position.x,position.y,radius*3,radius*3);
     fill(209,190,16);
     ellipse(position.x + .5,position.y + .5, radius*2, radius*2);
   }
   if (display == 2){
     strokeWeight(3);
     stroke(0);
     fill(67,4,4);
     triangle(position.x - 5,position.y + 8.66,position.x,position.y,position.x + 5,position.y + 8.66);
     fill(240,8,8);
     triangle(position.x - 5.5,position.y + 9.52,position.x,position.y,position.x + 5.5,position.y + 9.52);
   }
   if (display == 3){
     strokeWeight(3);
     stroke(0);
     fill(120);
     triangle(position.x - 10, position.y, position.x,position.y + 10, position.x + 10, position.y);
     fill(60);
     triangle(position.x - 5, position.y, position.x, position.y + 5, position.x + 5, position.y);
   }
   if (display == 4){
     strokeWeight(4);
     stroke(0);
     fill(255);
     triangle(position.x - 5, position.y, position.x,position.y - 5, position.x + 10, position.y+10);
   }
   if (display == 5){
     strokeWeight(4);
     stroke(0);
     fill(255);
     triangle(position.x - 10, position.y + 10, position.x,position.y - 5, position.x +5, position.y);
   }
   if (display == 6){
     strokeWeight(2);
     stroke(0);
     fill(255);
     triangle(position.x - 5, position.y -5, position.x,position.y + 10, position.x +5, position.y -5);
   }
 }
}
