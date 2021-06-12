public class ContactControlller {

   @AuraEnabled(cacheable=true)
   public static list<Contact> getcontacts(string str ){

   string searchstr = '%' + str + '%';

   List<Contact> conlist = new list<Contact>([SELECT Id, FirstName, LastName, Email, Phone from Contact WHERE name LIKE : searchstr]);
        
   return conlist;
    }

   @AuraEnabled
   public static contact createcontact(Contact con){
  // con.AccountId = AccountId;
   insert con;
   return con;

  }

}