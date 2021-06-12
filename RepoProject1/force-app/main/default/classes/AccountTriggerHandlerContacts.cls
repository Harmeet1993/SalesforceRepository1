public class AccountTriggerHandlerContacts {



    public static void onAfterInsert(list<Account> acclist){

      list<Contact> Conlist = new list<Contact>();
        for(Account acc : acclist){
           Contact con = new Contact();
             con.LastName = acc.Name;
             con.Email = 'Harmeet@gmail.com';
             con.Phone = acc.Phone;
              Conlist.add(con);
        }

        if(!Conlist.isEmpty()){
            insert Conlist;
        }

    }

    public static void onAfterUpdate(list<Account> acclist, Map<Id, Account> OldMap){
       list<Contact> conlist = [Select Id, LastName, Email, AccountId from Contact where AccountId IN : OldMap.keySet()];      
           for(Contact con : conlist){
               if(OldMap.containsKey(con.AccountId)){
                 con.LastName = OldMap.get(con.AccountId).Name;
                 con.Phone = OldMap.get(con.AccountId).Phone;
                 con.Email ='Harmeet@gmail.com';
               }
           }
     
        update conlist;

    }            
 
    


}