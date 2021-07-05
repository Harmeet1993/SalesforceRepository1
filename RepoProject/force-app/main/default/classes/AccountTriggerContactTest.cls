@isTest
public class AccountTriggerContactTest {


    public static testMethod void onAfterInsert(){
        Account acc = new Account(Name = 'Test', Phone = '9123106445');
        Test.startTest();
        insert acc;
        Test.stopTest();
        Contact con = [Select Id, LastName, AccountId from Contact where AccountId = :acc.Id];
        system.assert(con.Id!=null);
        
    }


    public static testMethod void OnAfterUpdate(){
       Account acc = new Account(Name='Test Account', Phone='454646');
       insert acc;
       Contact con = new Contact();
       con.LastName = 'Singh';
       con.AccountId = acc.Id;
       con.Email = 'Singh@gmail.com';
       insert con;
       Test.startTest();
       acc.Phone = '974512';
       update acc;
       Test.stopTest();
       //Not confirm if correct or not
       system.assertEquals(con.Phone, acc.Phone);
       

    }

}