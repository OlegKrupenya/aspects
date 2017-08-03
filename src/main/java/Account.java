public class Account {
    int balance = 20;

    public boolean withdraw(int amount) throws InterruptedException {
        doSomething(amount);
        Thread.sleep(1500);
        if (balance < amount) {
            return false;
        }
        balance = balance - amount;
        return true;
    }

    private boolean doSomething(int amount) throws InterruptedException {
        Thread.sleep(500);
        return true;
        //System.out.println("doSomething");
    }
}
