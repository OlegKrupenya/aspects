import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.TemporalUnit;
import java.util.Date;

public privileged aspect AccountAspect {
    final int MIN_BALANCE = 10;
    Date beforeDate;
    Date afterDate;

    pointcut callWithDraw(int amount, Account acc) :
            call(boolean Account.doSomething(int)) && args(amount) && target(acc);

    before(int amount, Account acc) : callWithDraw(amount, acc) {
        beforeDate = new Date();
    }

    boolean around(int amount, Account acc) :
            callWithDraw(amount, acc) {
        System.out.println("about to move");
//        if (acc.balance < amount) {
//            return false;
//        }
        return proceed(amount, acc);
    }

    after(int amount, Account balance) : callWithDraw(amount, balance) {
        afterDate = new Date();
        System.out.println(afterDate.getTime() - beforeDate.getTime());
    }
}