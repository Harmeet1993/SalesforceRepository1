public class ContactcontrollerDataTable {

  @AuraEnabled(cacheable=true)
   public static list<Contact> getcontacts(string str ){

   string searchstr = '%' + str + '%';

   List<Contact> conlist = new list<Contact>([SELECT Id, FirstName, LastName, Email, Phone from Contact limit 10]);
        
   return conlist;
    }


}