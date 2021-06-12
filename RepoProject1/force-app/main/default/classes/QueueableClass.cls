public class QueueableClass implements Queueable {

    public void execute(QueueableContext qc){
    list<Account> acclist = [Select Id, Name, Fax from Account];
    Integer acc_size = acclist.size();
        for(Integer i=0; i<acc_size; i++){
           Account acc = acclist.get(i);
            if(acc.Fax == null){
              acc.Fax = '9123106440';
            }
        }

     Update acclist;
     system.enqueueJob(new OpportunityQueueableClass());
    }

}