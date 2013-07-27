// The API
interface Notification {
	public void notify (Event e);
}
abstract class Subscriber {
	public boolean subscribe (String edl, Notification notifier);
}
abstract class Event {
	String name;
	ArrayList<Attribute> attr;
}
abstract class Attribute {
	String key;
	String value;
}
// How to use the API
class EventHandler implements Notification {
	public void notify (Event e) {
		if (e.name.compareTo("LightEvent")==0)
			System.out.println("Light Event received!");
	}
}
class SomeApplication implements Runnable {
	public void run () {
		String prog = "...";
		Subscriber sub = new Subscriber ();
		EventHandler handler = new EventHandler();
		sub.subscribe(prog, handler);
		while (true)
			Thread.sleep(1000);
	}
}

