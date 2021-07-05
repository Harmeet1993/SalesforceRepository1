@isTest
public class AccountDeleteHandlerTest {


    public static testMethod void PreventDeletionTest(){
         Account acc = new Account(Name='Test', Phone='9123111');
         insert acc;
        list<opportunity> opplist = new list<opportunity>();
        for(Integer i=0; i<10; i++){
          opportunity opp = new opportunity();
           opp.AccountId = acc.Id;
           opp.Name = 'Test' + string.valueof(i);
           opp.CloseDate = System.today();
           opp.StageName = 'ClosedWon';
           opplist.add(opp);
        }

      insert opplist;

       Test.startTest();
        try{
          delete acc;
        }catch(Exception ex){

        }
        Test.stopTest();


    }

}