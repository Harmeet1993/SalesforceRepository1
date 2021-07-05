public class AccountDeleteHandler {


    public static void PreventDeletion(list<Account> acclist, Map<Id, Account> OldMap){
      Map<Id, opportunity> oppMap = new Map<Id, opportunity>();
      list<opportunity> opplist = new list<Opportunity>();
       opplist = [select Id, StageName, AccountId from Opportunity where AccountId IN : OldMap.keyset() AND IsWon= true];
        for(opportunity op : opplist){
            if(!oppMap.containsKey(op.AccountId)){
           oppMap.put(op.AccountId, op);

            }
        }  

        for(Account acc : acclist){
            if(oppMap.containsKey(acc.Id)){
                acc.addError('Cannot Delete');
             }
         }

    }

}