public class AccountTrg1Handler {


    public static void onBeforeInsert(list<Account> acclist){
        for(Account acc : acclist){
            if(acc.Industry!= null && acc.Industry == 'Media'){
              acc.Rating = 'Hot';
            }
        }
 
    }

    public static void onAfterInsert(list<Account> acclist){
     list<opportunity> opplist = new list<opportunity>();
        for(Account acc : acclist){
            opportunity op = new opportunity();
             op.AccountId = acc.Id;
             op.StageName = 'Prospecting';
             op.Name = acc.Name;
             op.CloseDate = system.today();
             opplist.add(op);
        }

     insert opplist;
    }

}