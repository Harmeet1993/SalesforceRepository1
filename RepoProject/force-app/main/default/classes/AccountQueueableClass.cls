public class AccountQueueableClass implements Queueable {

   list<Account> acclist = new list<Account>();
   public Account acc;

    public AccountQueueableClass(list<Account> TriggerNew){
       this.acclist = TriggerNew;  
    }


    public void execute(QueueableContext QC){
      list<Contact> conlist = new list<Contact>();
        for(Account acc : acclist){
           Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            con.FirstName = 'Kane';
            con.Email = 'Kane@gmail.com';
            conlist.add(con);
        }

        if(!conlist.isEmpty()){
          insert conlist;
        }

     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      list<String> emailList = new list<String>();
      mail.setSubject('AccountQueueableEmail');
      mail.setHtmlBody('Contact Name is:' +acc.Name +
                        '<br/> Account Name is:' +acc.Name +
                        '<br/>AccountId is : ' +acc.Id);
     mail.setSenderDisplayName('RobertHalf');
     mail.setToAddresses(emailList);
     emailList.add('Singhharmeet1808@gmail.com');
     emailList.add('Harmeet.singh@FissionLabs.com');
     list<Messaging.SingleEmailMessage> EmailMessageList = new list<Messaging.SingleEmailMessage>();
     EmailMessageList.add(mail);

     Messaging.sendEmail(EmailMessageList, false);
     
    }

}