@isTest
public class AccountTriggerTest {

    @istest static void accounttest(){
        
        List<Account> acclist = new list<Account>();
        for(Integer i=0; i<100; i++){
        Account acc = new Account(Name = 'Test Acccount'+ i, Industry = 'Agriculture', Type='Prospect');
        acclist.add(acc);
  }
       insert acclist;
       list<Account> actlist = [select id, name, Rating from Account where Id IN : acclist];
        for(Account acc : actlist){
        system.assertEquals('Hot', acc.Rating);
       

 } 
}


}