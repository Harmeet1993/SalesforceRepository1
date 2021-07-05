@isTest
public class AccountActionTest {

    private static testMethod void onAfterInsertTest(){
          Account acc = new Account();
          acc.Name = 'Test';
          acc.Phone = '91565643';
          acc.Type = 'other';
          Test.startTest();
          insert acc;
          Test.stopTest();
          contact con = [select Id, Name from COntact where AccountId = :acc.Id];
          system.assert(con.Id != null);

    }


    private static testMethod void onAfterUpdateTest(){
       Account acc = new Account();
          acc.Name = 'Test';
          acc.Phone = '91565643';
          acc.Type = 'other';
          insert acc;
          Test.startTest();
           acc.Phone = '56797543';
           update acc;
          Test.stopTest();
          opportunity op = [select Id, Name from Opportunity where AccountId =:acc.Id];
          system.assert(op.Id != null);

    }

}