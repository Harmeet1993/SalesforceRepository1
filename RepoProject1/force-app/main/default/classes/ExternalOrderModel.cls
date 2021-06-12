public with sharing class ExternalOrderModel extends ExternalObjectModelBase{

   private static ExternalOrderModel uniqueInstance;

    //Private Constructor for Singleton
    private ExternalOrderModel() {

    }

    //Singleton getter
    public static ExternalOrderModel getInstance() {
        if(uniqueInstance == null)
            uniqueInstance = new ExternalOrderModel();

        return uniqueInstance;
    }

    

    public Account__x findbyAccountfax(string fax){
    list <Account__x> acclist = [SELECT Id, Name__c, Fax__c from Account__x where fax__c = : fax];

    return(Test.isRunningTest()) ? (Account__x) mockedRecords[0] : (acclist.size() > 0) ? acclist[0] : null ;
    }
 
    public list<Account__x> findbyName(string AccName){
    list<Account__x> acclist = [SELECT Id, Name__c, Fax__c from Account__x  where Name__c = :AccName];
    return (Test.isRunningTest()) ? (list<Account__x>) mockedRecords : (acclist.size() > 0) ? acclist : null;

   }

}