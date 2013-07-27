// The basic APIs
abstract class Car {
	int id;
	public void registerListener (CarListener l);
	public void moveTo (int roadID, int pos);
	public void setSpeed (int speed);
}
interface CarListener {
	public void reportPos (Car c, int roadID, int pos);
}
abstract class TrafficLight {
	int id;
	public void turnOn (int color);
}
abstract class Camera {
	public void moveTo (int roadID);
}
// How to use
class Controller implements CarListener {
	public void reportPos (Car c, int roadID, int pos) {
		if (c.id==1 && roadID==1)
			c.moveTo(2, 0);
		else if (c.id==1 && roadID==2)
			c.moveTo(3, 0);
		else if (c.id==1 && roadID==3)
			c.moveTo(1, 0);

	}
}
class Demo implements Runnable {
	public void run () {
		Controller con = new Controller();
		Car c = new Car(1);
		c.registerListener(con);
		c.moveTo (1, 0);
		while (true)
			Thread.sleep(1000);
	}
}
