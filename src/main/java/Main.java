import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.*;

public class Main {
    public static void main(final String[] args) throws Exception {


            TimerTask task = new TimerTask() {
                public void run() {
                    System.out.println("Task performed on: " + new Date() + "n" +
                            "Thread's name: " + Thread.currentThread().getName());
                }
            };
            Timer timer = new Timer("Timer");

            long delay = 1000L;
            timer.schedule(task, delay);
    }

}