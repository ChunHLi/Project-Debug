public abstract class Units{
	int HP, hitboxH, hitboxL;
	PVector position,velocity;
	abstract void hitdetect();
	PVector direction, velocity;

	public void setHP(int newHP){
		HP = newHP;
	}
	public void sethitboxH(int newH){
		hitboxH = newH;
	}
	public void sethitboxL(int newL){
		hitboxL = newL;
	}
}
