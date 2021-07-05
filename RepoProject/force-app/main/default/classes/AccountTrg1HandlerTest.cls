@isTest
public class AccountTrg1HandlerTest {


    public static testMethod void onBeforeInsertTest(){
      Account acc = new Account(Name= 'Test', Industry='Media');
      insert acc;
      Test.startTest(); 
      system.assertEquals('Hot', acc.Rating);
       Test.stopTest();
 
    }

    public static testMethod void onAfterInsertTest(){
        Account acc = new Account(Name= 'Test', Industry='Media');
        Test.startTest();
        insert acc;
        opportunity op = [select Id, Name, AccountId from opportunity where AccountId = :acc.Id ];
        system.assert(op.Id != null);

    }


}