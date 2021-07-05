trigger AccountAction on Account (after insert, after update) {

    if(Trigger.isAfter){
        if(Trigger.isInsert){
           AccountActionHandler.OnAfterInsert(trigger.new);
        } else if(Trigger.isUpdate){
           AccountActionHandler.OnAfterUpdate(trigger.new, trigger.oldMap);
    
       }


   }

}