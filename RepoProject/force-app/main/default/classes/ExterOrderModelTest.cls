@isTest
public class ExterOrderModelTest {

    private static void createtestdata(){
    Account__x acc1 = new Account__x();
    acc1.Name__c = 'Fission Labs';
    acc1.Fax__c = '999';
    acc1.Industry__c = 'Agriculture';

    Account__x acc2 = new Account__x();
    acc2.Name__c = 'Fission2 Labs';
    acc2.Fax__c = '9999';
    acc2.Industry__c = 'Banking';
    

    list<Account__x> acclist = new list<Account__x>{acc1 , acc2};
        
    ExternalOrderModel extOrderModel = ExternalOrderModel.getInstance();
    extOrderModel.addTestRecords(accList);
    }

    @isTest static void findbyAccountfax(){
     createtestdata();
     Test.startTest();
     Account__x acc = ExternalOrderModel.getInstance().findByAccountfax('1455');
     system.assertEquals('Fission Labs', acc.Name__c );
     Test.stopTest();
   }

    @isTest static void findbyAccountName(){
    createtestdata();
    Test.startTest();
    list<Account__x> acclist = ExternalOrderModel.getInstance().findByName('Fission');
    system.assertEquals(acclist.size(), 2);
    Test.stopTest();

  }

}