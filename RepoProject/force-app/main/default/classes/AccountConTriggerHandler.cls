public with sharing class AccountConTriggerHandler {
    
    @future
    public static void createcontact(string accjson) {
       
      list<contact> conlist = new list<contact>();  
      list<Account> acclist = (list<Account>) JSON.deserialize(accjson, list<Account>.class);
       for(Account acc : acclist){
        contact con = new contact();
        con.lastName = acc.name;
        con.Email = 'john@gmail.com';
        con.phone = acc.phone;
        conlist.add(con);
       }

       insert conlist;

    }
}