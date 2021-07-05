public with sharing class AccOppHandler {


    public static void updatePhone(List<Account> acclist, Map<Id, Account> OldMap) {
          for(Account acc :acclist){
           if(OldMap!= null && acc.phone != OldMap.get(acc.Id).Phone){
               acc.Description = 'Phone of Account is modified';

            }
          }
        }

     public static void updateRelatedOpp(List<Account> acclist , Map<Id, Account> OldMap){
           Map<Id, Account> accMap = new Map<Id, Account>();
           list<opportunity> opplist = new list<opportunity>();
           for(Account acc : acclist){
              if(OldMap!= null && acc.phone != OldMap.get(acc.Id).Phone){

                accMap.put(acc.Id, acc);
              }

           for(opportunity op : [select id, AccountId, Phone__c from opportunity where AccountId IN : accMap.keySet()]){
               if(accMap.containskey(op.AccountId)){
                  opportunity opp = new opportunity();
                  opp.Id = op.Id;
                  opp.Phone__c = accMap.get(op.AccountId).Phone;
                  opplist.add(opp);
               }  

           }  
           
           update opplist;
           

           }

     }



    
}