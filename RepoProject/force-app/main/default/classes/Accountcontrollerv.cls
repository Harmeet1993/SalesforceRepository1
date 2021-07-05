public class Accountcontrollerv {

    public Account acc{get;set;}
    public list<Account> acclist{get;set;}
    
    public Accountcontrollerv(){
    acc = new Account();
   // acclist = new list<Account>();
   
   }
 
    public pageReference saveAccount(){
    insert acc;
    return new pageReference('/' + acc.Id);
    }

    public void displayAccount(){
     acclist = new list<Account>();
     acclist = [Select Name, Type,fax from Account limit 10];
     system.debug('Account' +acclist);
 
     }

}