public class ContactBatch implements Database.Batchable<SObject>, Database.Stateful{

   public Integer success_size = 0;
   public Integer fail_size = 0;
   public Integer total_size = 0;

    public Database.QueryLocator Start(Database.BatchableContext bc){
    string query = 'SELECT Id, FirstName, LastName, Email, Phone from Contact';
    return Database.getQueryLocator(query);
    }


    public void Execute(Database.BatchableContext bc, list<Contact> Conlist){
        Integer size = Conlist.size();
        total_size = total_size + size;
        for(Integer i=0; i<size; i++){
        Contact con = conlist.get(i) ;
             if(con.Email == null ){
               con.Email = 'John@Salesforce.com';
             }
        }
        //update Conlist;

        Database.SaveResult[] result = Database.update(Conlist, false);

        Integer result_size = result.size();
        for(Integer i=0; i<result_size; i++){
         Database.SaveResult res = result.get(i);
            if(res.isSuccess()){
            success_size += 1;
            } else {
               fail_size += 1; 
            }
   
         }

    }

    public void Finish(Database.BatchableContext bc){
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     email.setSubject('Contact Batch Apex');
     email.setSenderDisplayName('Harmeet Singh');
     email.setHtmlBody('Hello User <br/> Batch Processed Successfully' +
                        '<br/> Total Size: '  +total_size + 
                        '<br/> Number of Records Updated: ' +success_size +
                        '<br/> Number of Records failed :'  +fail_size);
     list<string> emailto = new list<string>();
     emailto.Add('Singhharmeet1808@gmail.com');
     email.setToAddresses(emailto);
     Messaging.SingleEmailMessage[] emailList = new list<Messaging.SingleEmailMessage>();
     emailList.add(email);
     Messaging.sendEmail(emailList, false);
    }

}