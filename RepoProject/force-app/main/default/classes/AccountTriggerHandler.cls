public class AccountTriggerHandler {

    public static void updateRating(list<Account> acclist){
        for(Account acc: acclist){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }


    public static void createRelatedOpp(list<Account> acclist){
       list<Opportunity> opplist = new list<opportunity>();
     
        for(Account acc : acclist){
           opportunity opp = new opportunity();
           opp.Name = acc.Name;
           opp.AccountId = acc.Id;
           opp.StageName = 'Prospecting';
           //opp.CloseDate = system.today();
           opplist.add(opp);
        }
      
        Database.SaveResult[] res = Database.update(opplist, false);
       
        for(Integer i=0; i<res.Size(); i++){
            if(!res.get(i).issuccess()){
               string error = '';
                for(Database.Error err : res[i].getErrors()){
                   error = error + err.getMessage();
                    acclist[i].addError(error);
                 }

            }
        }


    }

    public static void updatePhoneDescription(list<Account> acclist, Map<Id, Account> OldMap){
        for(Account acc :acclist){
            if(OldMap != null && acc.phone != OldMap.get(acc.id).phone){
               acc.Description = 'Phone is Modified';
            }
        }

   }
   
    public static void updateRelatedOppPhone(list<Account> acclist, Map<Id, Account> OldMap){

      list<opportunity> opptoinsertlist = new list<opportunity>();
       Map<id, Account> AccMap = new Map<id, Account>();
        for(Account acc : acclist){
            if(OldMap != null && acc.Phone != OldMap.get(acc.id).phone){
                  AccMap.put(acc.Id, acc);
            }
        }  
   
        for(opportunity opp : [select id, Name, StageName, AccountId from opportunity where AccountId IN : AccMap.keySet()]){
           opportunity oppr = new opportunity();
            if(AccMap.containskey(opp.AccountId)){
               oppr.StageName = 'Closed Won';
               opptoinsertlist.add(opp);
             }
        }

      update opptoinsertlist;


   }


   
 }