trigger AccountTriggerforContacts on Account (after insert) {
 
    if(Trigger.isInsert){
        if(Trigger.isAfter){
           system.enqueueJob(new ContactCreationQueueable(Trigger.new));

        }
    
    }    

   }