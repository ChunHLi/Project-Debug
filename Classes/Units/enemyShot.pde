class enemyShot extends Bullet{
 boolean contactPlayer;
 PImage eShotSprite;
 int eShotCounter;
 float vel;
  
 enemyShot(float x, float y,float nvel, int newEShotCounter, ArrayList<Player> whatever){
    position.x = x;
    position.y=y;
    vel = nvel;
    eShotSprite = loadImage("../../Sprites/Bullets/Enemy/BulletSprites.png");
    eShotCounter = newEShotCounter;
    if (playerList.size() > 0){
      calcVXY(whatever.get(0));
    }
    else{
      velocity.x = 10;
      velocity.y = 10;
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
         other.invulnTime = 3600;
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
   if (position.y + velocity.y > height || position.y + velocity.x < 0){
     removeEShot(eShotCounter);
   }
   if (position.x + velocity.x + 5 <= width/2 && position.x + velocity.x > 0){
     position.x += velocity.x;
   }
   if (position.x + velocity.x + 5> width/2 || position.x + velocity.x < 0){
     removeEShot(eShotCounter);
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
   image(eShotSprite.get(1,32,18,20),position.x-9,position.y);
 }
}
