public class OpportunityTriggerHandler {

   
    public static void onAfterInsert(list<opportunity> opplist){
       Set<Id> accId = new set<Id>();
       list<Account> accTobeupdate = new list<Account>();
        for(opportunity opp : opplist){
            if(opp.AccountId != null){
                  accId.add(opp.AccountId);
            }
        }

     accTobeupdate = calculateAnnualRevenue(accId);
        if(!accTobeupdate.isEmpty()){
          update accTobeupdate;
        }

     }

    public static void OnAfterUpdate(list<Opportunity> opplist, Map<Id, Opportunity> OldMap){
         Set<Id> accId = new set<Id>();
         list<Account> accTobeupdate = new list<Account>();
        for(opportunity op : opplist){
            if(op.amount!=null && op.amount != OldMap.get(op.Id).Amount){
               accId.add(op.AccountId);
            }
        }
     accTobeupdate = calculateAnnualRevenue(accId);
 
        if(!accTobeupdate.isEmpty()){
            update accTobeupdate;
        }
      
    }
 
    public static void OnAfterDelete(list<opportunity> opplist){
         Set<Id> accId = new set<Id>();
         list<Account> accTobeupdate = new list<Account>();
           for(opportunity opp : opplist){
               if(opp.AccountId != null){
                  accId.add(opp.AccountId);
                }
           }
      accTobeupdate = calculateAnnualRevenue(accId);
        if(!accTobeupdate.isEmpty()){
            update accTobeupdate;
         }
        
    }
 
    public static list<Account> calculateAnnualRevenue(Set<Id> accIdset){
      list<Account> Acctobeupdate = new list<Account>();
      Map<Id, Decimal> AccOppMap = new Map<Id, Decimal>();
        for(opportunity opp : [select Id, Amount, AccountId from Opportunity where AccountId IN : accIdset]){
             Decimal total =0;
            if(AccOppMap.containsKey(opp.AccountId)){
               total = AccOppMap.get(opp.AccountId);
            }
                if(opp.Amount != null){
                  total = total + opp.Amount;
                }
            
          AccOppMap.put(opp.AccountId, Total);
        }
    
        if(!AccOppMap.isEmpty()){
            for(Id i : AccOppMap.keySet()){
              Account acc = new Account();
              acc.Id = i;
              acc.AnnualRevenue = AccOppMap.get(i);
              Acctobeupdate.add(acc);
           }
        }
     return Acctobeupdate;
   
}
   

}