public class ContactHandler {

    public static void CreateCase(Map<Id, Contact> NewMap , Map<Id, Contact> OldMap){
    list<Case> Caselist = new list<Case>();
        for(Contact con : NewMap.values()){
         Case cs = new case();
         cs.Status = 'Open';
         cs.Priority = 'High';
         cs.Origin = 'Other';
         cs.ContactId = con.Id;
         caselist.add(cs);
   }

    insert caselist;

}
     
    public static void preventDelete(list<contact> oldlist){
        for(contact con : oldlist){
         con.addError('Contact cannot be deleted'); 
}
    }

}