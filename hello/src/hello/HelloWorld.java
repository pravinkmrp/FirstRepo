package hello;
import java.util.Date;

public class HelloWorld {
    public static void main(String[] args) {
        Greeter greeter = new Greeter();
	Date ltime;
	ltime = new Date();
	System.out.println(" My LocalTime:" + ltime);
        System.out.println(greeter.sayHello());
    }
}
