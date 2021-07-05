@isTest
public class AccountControllerVTest {


    public static testMethod void TestAccountCreation(){

      Account acct = TestDatafactory.PrepareAccount();
      Test.startTest();
      Accountcontrollerv acv = new Accountcontrollerv();
      acv.acc = acct;
      acv.saveAccount();
      Test.stopTest();
      Account acc = [Select Id, Name from Account where Name='Raymond' limit 1];
      system.assert(acc.Id != null);

   }


}