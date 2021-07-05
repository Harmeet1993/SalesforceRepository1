@isTest
public class AccountTriggerContactsTest {


    @TestSetup static void SetupData(){
      
       Account acc = new Account(Name='Test Account', Fax = '456936', Phone='975645');
        insert acc;

    }


    public static testmethod void OnAfterInsertTest(){
        
        Account acc = [Select Id, Name, Fax, Phone from Account limit 1];
        system.debug('Account is' +acc);
        //Test.startTest();
        //insert acc;
        //Test.stopTest();
        list<Account> acclist = new list<Account>();
        acclist.add(acc);
        AccountTriggerHandlerContacts.OnAfterInsert(acclist);
        Contact con = [select Id, Name, AccountId from Contact Where AccountId = :acc.Id];
         
         system.assert(con.Id != null);
    }

    public static testmethod void onAfterUpdateTest(){
      list<Account> acclist = new list<Account>();
      Map<Id, Account> AccMap = new Map<Id, Account>();
      Account acc = [select Id, Name, Fax, Phone from Account limit 1];
      AccMap.put(acc.Id, acc);
     // Test.startTest();
      acc.Name = 'Fission';
      acc.Phone = '85254650';
      acclist.add(acc);
     //update acclist;
      //Test.stopTest();
      AccountTriggerHandlerContacts.OnAfterUpdate(acclist, AccMap);
       Contact con = [select Id,Name, AccountId from Contact where AccountId = :acc.Id];
       system.assertEquals('Fission', con.LastName);
       system.assertEquals('85254650', con.Phone);
       system.assertEquals('Harmeet@gmail.com', con.Email);

    }

}