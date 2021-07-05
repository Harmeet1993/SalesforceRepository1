@isTest
public class AccTestDataFactory {

    public static Account CreateAccount(){
      Account accnt = new Account();
        accnt.Name = 'Test Account';
        accnt.Fax = '111111';
        accnt.Phone = '25254545';
        return accnt;

    }

}