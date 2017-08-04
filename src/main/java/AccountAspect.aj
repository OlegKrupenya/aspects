import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.TemporalUnit;
import java.util.Date;

public privileged aspect AccountAspect {
    long beforeTime;
    long afterTime;

    pointcut callWithDraw(int amount, Account acc) :
            call(boolean Account.doSomething(int)) && args(amount) && target(acc);

    before(int amount, Account acc) : callWithDraw(amount, acc) {
        beforeTime = System.nanoTime();
    }

    boolean around(int amount, Account acc) :
            callWithDraw(amount, acc) {
        System.out.println("around");
//        if (acc.balance < amount) {
//            return false;
//        }
        return proceed(amount, acc);
    }

    after(int amount, Account balance) : callWithDraw(amount, balance) {
        afterTime = System.nanoTime();
        System.out.println((afterTime - beforeTime) / 1000000);
    }
}