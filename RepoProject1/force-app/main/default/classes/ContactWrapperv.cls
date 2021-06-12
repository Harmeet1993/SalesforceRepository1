public class ContactWrapperv {

    public list<ContactWrapper> conwraplist{get;set;}
    public list<ContactWrapper> conselectedlist{get;set;}
  
    public ContactWrapperv(){
    conwraplist = new list<ContactWrapper>();
    conselectedlist = new list<ContactWrapper>();
    ContactWrapper con = new ContactWrapper();
    con.FirstName = 'Shane';
    con.LastName = 'Warne';
    con.Email = 'Shane@gmail.com';
    con.isChecked = false;
    conwraplist.add(con); 
    ContactWrapper con1 = new ContactWrapper();
    con1.FirstName = 'Steve';
    con1.LastName = 'Jobs';
    con1.Email = 'Steve@gmail.com';
    con1.isChecked = false;
    conwraplist.add(con1);
        for(Contact cont : [Select FirstName, LastName, Email from Contact limit 10]){
        ContactWrapper con2 = new ContactWrapper();
        con2.FirstName = cont.FirstName;
        con2.LastName =  cont.LastName;
        con2.Email = cont.Email;
        con2.isChecked = false;
        conwraplist.add(con2);
        }
   }  

    public void DisplaySelected(){
        conselectedlist = new list<ContactWrapper>();
        for(ContactWrapper conwrap : conwraplist){
          if(conwrap.isChecked){
          conselectedlist.add(conwrap);
          }
         }

    }

    public class ContactWrapper{
        public string FirstName{get;set;}
        public string LastName{get;set;}
        public string Email{get;set;}
        public boolean isChecked{get;set;}
   }

}