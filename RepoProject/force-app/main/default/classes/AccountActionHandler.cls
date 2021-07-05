public class AccountActionHandler {


    public static void onAfterInsert(list<Account> acclist){
       list<Contact> conlist = new list<contact>();
        for(Account acc : acclist){
           Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            con.Email = 'Harmeet@gmail.com';
            conlist.add(con);

       }

        if(!conlist.isEmpty()){
            insert conlist;
         }

    }

    public static void onAfterupdate(list<Account> acclist, Map<Id, Account> OldMap){
       list<opportunity> opplist = new list<opportunity>();
        for(Account acc : acclist){
            if(OldMap != null && acc.Phone!= OldMap.get(acc.Id).Phone){
              opportunity op = new opportunity();
              op.AccountId = acc.Id;
              op.Name = acc.Name;
              op.StageName = 'Prospecting';
              op.CloseDate = system.today();
              opplist.add(op);
              
            }
        }

        if(!opplist.isEmpty()){
          insert opplist;
       }


   }

}