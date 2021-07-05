trigger AccountQueueable on Account (After insert) {

    if(Trigger.isInsert && Trigger.isAfter){
        system.enqueueJob(new AccountQueueableClass(Trigger.new));
    }


}