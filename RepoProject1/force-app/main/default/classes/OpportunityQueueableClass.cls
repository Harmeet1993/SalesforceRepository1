public class OpportunityQueueableClass implements Queueable {


    public void execute(QueueableContext Qc){
    list<Opportunity> opplist = [Select Id, Amount, StageName from Opportunity];
        if(!opplist.isEmpty()){
        for(opportunity op : opplist){
            if(op.Amount == null){
                op.Amount = 75000;
            }
         }  
        
   update opplist;
       }
    }

}