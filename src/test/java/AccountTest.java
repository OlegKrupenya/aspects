import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class AccountTest {
    private Account account;

    @Before
    public void before() {
        account = new Account();
    }

    @Test
    public void given20AndMin10_whenWithdraw5_thenSuccess() throws InterruptedException {
        assertTrue(account.withdraw(5));
    }

//    @Test
//    public void given20AndMin10_whenWithdraw100_thenFail() throws InterruptedException {
//        assertFalse(account.withdraw(100));
//    }
}
