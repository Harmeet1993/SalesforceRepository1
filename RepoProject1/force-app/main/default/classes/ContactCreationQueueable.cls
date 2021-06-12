public class ContactCreationQueueable implements Queueable {

     list<Account> acclisttocreateContact = new list<Account>();

    public ContactCreationQueueable(List<Account> acclist){
      this.acclisttocreateContact = acclist;
    
    }

    public void execute(Queueablecontext QC){
    
      list<Contact> Conlist = new list<Contact>(); 
      
        for(Account acc : acclisttocreateContact){
           Contact con = new Contact();
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId = acc.ID;
            con.Email= 'Harmeet@gmail.com';
            Conlist.add(con);
        }     
   
        if(!conlist.isEmpty()){
         Insert Conlist;    
        }
   }
   

}